class Love
  class Thanks

    def initialize

    end
    class << self

      def by_gemname
        thanks = ''
        template = for_site ? THANKS : THANKS_MD
        @gems.each do |gem|
          who = \
            if gem.authors.count > 1
              "these cool and creative people: #{gem.authors.map(&:name).join(', ')}"
            else
              "this cool and creative person #{gem.authors.first.name}"
            end
          what = "this awesome gem - #{gem.name}"
          b = binding
          thanks << ERB.new(template).result(b)
        end
        thanks
      end

      def thanks_by_author
        thanks = ''
        template = for_site ? THANKS : THANKS_MD
        @authors.each do |author|
          who = "my mate #{author.name}"
          what = \
            if author.gems.count > 1
              "these great libraries: #{author.gems.map(&:name).join(', ')}! Wow man! You awesome!"
            else
              "this helpful and useful gem - #{author.gems.first.name}"
            end
          b = binding
          thanks << ERB.new(template).result(b)
        end
        thanks
      end

      # WIP
      def thanks_to_contributors
        thanks = ''
      end

    end
  end
end
