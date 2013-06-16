require 'octokit'

class ShareSomeLove
  class Person

    attr_reader :name, :info, :gems

    def initialize(name, fetch = true)
      @name = name
      @gems = []
      fetch_info if fetch
    end

    def fetch_info
      search_person = Octokit.search_users name
      @info = \
        if search_person > 1
          puts '!!! THERE ARE SEVERAL PERSONS WITH THIS NAME IN GITHUB !!!'
          puts "Please check right man with his number and we'll continue"
          search_person.each_with_index do |person, index|
            puts "#{index} - name: #{person.name}; login: #{person.login}; username: #{person.username}"
          end

          Octokit.user search_person[gets.chomp.to_i].username
        else
          Octokit.user search_person.first.username
        end
    end

    def add_gem(gem)
      @gems << gem
    end

    def love(format)
      image = info.avatar_url
      who = "#{ShareSomeLove::ThankWords.person_prefix} #{name}"
      bold = true
      begin_thanking = ShareSomeLove::ThankWords.begin_phrase_for_author
      for_what = \
        if gems.count > 1
          "#{ShareSomeLove::ThankWords.libraries_prefix} #{gems.map(&:name).join(', ')}"
        else
          "#{ShareSomeLove::ThankWords.library_prefix} #{gems.first.name}"
        end
      finish_thanking = ShareSomeLove::ThankWords.end_phrase_for_author

      template = \
        if format == 'md'
          love_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'templates/md'))
          File.read(File.join(love_dir, 'person.erb'))
        else
          love_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'templates/html'))
          File.read(File.join(love_dir, 'person.erb'))
        end

      ERB.new(template).result(binding)
    end

  end
end
