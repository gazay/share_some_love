class Love
  module HtmlRenderer
    class << self

      def thanks
        Love::ThankWords.title_thanks
      end

      def style
        ''
      end

      def javasctipt
        ''
      end

      def content(template_name, body)

      end

    end
  end
end
