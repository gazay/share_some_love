class Love
  module ThankWords

    THANK_WORDS = YAML.read_file(Love.root.join "thank_words/#{Love.lang}.yml")

    class << self

      def title_thanks
        find_words('title_thanks')
      end

      def begin_phrase_for_author
        find_words('begin_author')
      end

      def connect_author_with_gem_phrase
        find_words('middle_author')
      end

      def end_phrase_for_author
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
        THANK_WORDS[area][rand(THANK_WORDS[area].length)]
      end

    end
  end
end
