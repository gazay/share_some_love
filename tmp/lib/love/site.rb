class Love
  module Site
    class << self

      def create_file
        title = Love::ThankWords.title_thanks
        thanks = \
          if by_gemname
            thanks_by_gemname
          else
            thanks_by_author
          end
        b = binding
        File.open('./public/love.html', 'w+') do |f|
          f.write ERB.new(TEMPLATE).result(b)
        end
      end

    end
  end
end
