module Love
  module Share
    class << self

      def md(by_gemname = false)
        if by_gemname
          render_by 'gem', 'md', Love.gems
        else
          render_by 'author', 'md', Love.authors
        end
      end

      def html(by_gemname = false)
        if by_gemname
          render_by 'gem', 'html', Love.gems
        else
          render_by 'author', 'html', Love.authors
        end
      end

      private

      def render_by(type_name, template_type, collection)
        template = \
          File.
            read(
              Love.root.join "../templates/#{template_type}/by_#{type_name}.#{template_type}.erb"
            )
        member_template = \
          File.
            read(
              Love.root.join "../templates/#{template_type}/_#{type_name}.#{template_type}.erb"
            )
        content = ''
        style_content = 'h1 { color: red; }'
        script_content = 'alert(1)'
        collection.each do |member|
          content << ERB.new(member_template).result(binding)
        end
        if template_type == 'html'
          File.open('./public/love.html', 'w+') do |f|
            f.write ERB.new(template).result(binding)
          end
        else
          File.open('./LOVE.md', 'w+') do |f|
            f.write ERB.new(template).result(binding)
          end
        end
      end

    end
  end
end
