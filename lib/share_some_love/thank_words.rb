class ShareSomeLove
  module ThankWords

    BEGIN_AUTHOR = \
      [
        "I'd like to thank",
        'I appreciate time of',
        'My sincere thanks to',
        'Thank you so much,',
        'Thank you very much,'
      ]

    MIDDLE_AUTHOR = \
      [
        'for creating and maintaining',
        'for made this idea happened, I mean',
        'for spending time on',
        'for making my life easier by creating',
        'for being so nice to create'
      ]

    END_AUTHOR = \
      [
        'I wanna hug you someday and say in person what great job you done!',
        'I wanna shake your hand and say that wihtout your work on it I would spent much more time and power!',
        'Just be so cool as you are and remember that your work never being useless!',
        'Enjoy what you did as I am!'
      ]

    TITLE_THANKS = \
      [
        'Thank you all, guys and girls who made my life easier and help me to enjoy make my project more and more!',
        "I'd like to thank all these people! Believe me - they are awesome!",
        'Love to these people! And bunch of hugs!'
      ]

    PERSON_PREFIX = \
      [
        'my mate',
        'awesome person',
        'great developer',
        'awesome programmer'
      ]

    LIBRARY_PREFIX = \
      [
        'this helpful and useful gem',
        'awesome project',
        'cool thing',
        'helpful thing'
      ]

    LIBRARIES_PREFIX = \
      [
        'these awesome and helpful gems',
        'a lot of great projects',
        'these awesome libraries'
      ]

    class << self

      def title_thanks
        TITLE_THANKS[rand(TITLE_THANKS.length)]
      end

      def begin_phrase_for_author
        BEGIN_AUTHOR[rand(BEGIN_AUTHOR.length)]
      end

      def connect_author_with_gem_phrase
        MIDDLE_AUTHOR[rand(BEGIN_AUTHOR.length)]
      end

      def end_phrase_for_author
        END_AUTHOR[rand(BEGIN_AUTHOR.length)]
      end

      def person_perfix
        PERSON_PREFIX[rand(PERSON_PREFIX.length)]
      end

      def library_prefix
        LIBRARY_PREFIX[rand(LIBRARY_PREFIX.length)]
      end

      def libraries_prefix
        LIBRARIES_PREFIX[rand(LIBRARIES_PREFIX.length)]
      end

      def hearts
        '<3' * rand(10)
      end

    end
  end
end
