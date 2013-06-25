module Love
  module Share
    class << self

      def md(by_gemname = false)
        if by_gemname
          render_by_gem Love.gems
        else
          render_by_author Love.authors
        end
      end

      private

      def render_by_author(authors)
        template = File.read(Love.root.join '../templates/md/by_author.md.erb')
        author_template = File.read(Love.root.join '../templates/md/_author.md.erb')
        content = ''
        authors.each do |author|
          content << ERB.new(author_template).result(binding)
        end
        File.open('./LOVE.md', 'w+') do |f|
          f.write ERB.new(template).result(binding)
        end
      end

      def render_by_gem(gems)
        template = File.read(Love.root.join '../templates/md/by_gem.md.erb')
        gem_template = File.read(Love.root.join '../templates/md/_gem.md.erb')
        content = ''
        gems.each do |gem|
          content << ERB.new(gem_template).result(binding)
        end
        File.open('./LOVE.md', 'w+') do |f|
          f.write ERB.new(template).result(binding)
        end
      end

    end
  end
end
