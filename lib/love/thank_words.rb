module Love
  module ThankWords
    class << self

      def title_thanks
        find_words('title_thanks')
      end

      def begin_author
        find_words('begin_author')
      end

      def middle_author
        find_words('middle_author')
      end

      def end_author
        find_words('end_author')
      end

      def person_perfix
        find_words('person_prefix')
      end

      def library_prefix
        find_words('library_prefix')
      end

      def libraries_prefix
        find_words('libraries_prefix')
      end

      def hearts
        '<3' * rand(10)
      end

      private

      def find_words(area)
        fill_thank_words unless defined?(@thank_words)
        cache_words rand_words_from(area), area
      end

      def fill_thank_words
        @thank_words = \
          YAML.load(File.read(Love.root.join "../thank_words/#{Love.lang}.yml"))
      end

      def cache_words(words, area)
        @previous ||= {}
        @previous[area] ||= []
        if @previous[area].count == @thank_words[area].count
          @previous[area] = []
        end
        if @previous[area].include? words
          find_words(area)
        else
          @previous[area] << words
          words
        end
      end

      def rand_words_from(area)
        @thank_words[area].to_a[rand(@thank_words[area].length)]
      end

    end
  end
end
