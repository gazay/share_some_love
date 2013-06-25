class Love
  class Gem

    attr_reader :name, :authors, :plain_authors, :spec

    def initialize(spec, fetch = true)
      @spec = spec
      @name = spec.name
      @plain_authors = spec.authors
      @authors = []
      fetch_authors if fetch
    end

    def fetch_authors
      plain_authors.each do |name|
        person = Person.new(name)
        person.add_gem self
        add_author person
      end
    end

    def add_author(author)
      @authors << author
    end

  end
end
