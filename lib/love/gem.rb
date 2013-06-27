module Love
  class Gem

    attr_reader :name, :authors, :plain_authors, :spec, :url

    def initialize(spec, fetch = true)
      @spec = spec
      @name = spec.name
      @plain_authors = spec.authors
      if spec.homepage.nil? or spec.homepage.empty?
        @url = "http://rubygems.org/gems/#{name}"
      else
        @url = spec.homepage
      end
      @authors = []
      fetch_authors if fetch
    end

    def fetch_authors
      plain_authors.each do |name|
        author = Love.authors.select { |a| a.name == name }.first
        if author
          add_author author
          author.add_gem self
        else
          person = Love::Author.new(name)
          person.add_gem self
          add_author person
          Love.authors << person
        end
      end
    end

    def add_author(author)
      @authors << author
    end

  end
end
