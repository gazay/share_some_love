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

    def thanks
      who = \
        if authors.count > 1
          "these cool and creative people: #{authors.map(&:name).join(', ')}"
        else
          "this cool and creative person #{authors.first.name}"
        end
      what = "this awesome gem - #{name}"
    end

    class << self

      def create_file
        thanks = \
          if by_gemname
            thanks_by_gemname
          else
            thanks_by_author
          end
        b = binding
        File.open('./LOVE.md', 'w+') do |f|
          f.write ERB.new(TEMPLATE_MD).result(b)
        end
      end

    end
  end
end
