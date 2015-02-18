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
        template, member_template = templates(type_name, template_type)

        style_content = 'h1 { color: red; }'
        script_content = 'alert(1)'
        begin_content = File.read(Love.root.join "../hearts/ascii1.txt")
        generated_by_content = "This file was respectfully generated by #{Love.octokit.login}"
        end_content = File.read(Love.root.join "../hearts/surfer.txt")

        content = ''
        collection.each do |member|
          content << ERB.new(member_template).result(binding)
        end

        file_path = template_type == 'html' ? './public/love.html' : './LOVE.md'
        File.open(file_path, 'w+') do |f|
          f.write ERB.new(template).result(binding)
        end
      end

      def templates(type_name, template_type)
        path_part1 = "../templates/#{template_type}/"
        path_part2 = "_#{type_name}.#{template_type}.erb"
        [
          File.read(Love.root.join "#{path_part1}by#{path_part2}"),
          File.read(Love.root.join "#{path_part1}#{path_part2}"),
        ]
      end

    end
  end
end
