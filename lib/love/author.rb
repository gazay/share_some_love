require 'octokit'

class Love
  class Author

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

  end
end
