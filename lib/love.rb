require 'bundler'
require 'erb'

module Love
  class << self

    TEMPLATE =<<EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Thank you all, guys and girls!!! Luv u!</title>
  </head>
  <body>
    <%= thanks %>
  </body>
</html>
EOF
    THANKS =<<EOF
<div class='thank-you'>
  I'd like to thank <%= who %> for creating and maintaining <%= what %>.
  I wanna hug you someday and say in person what great job you done!
  <%= '<3' * rand(10) %>
</div>
EOF

    def share_for(args)
      if args.include 'site'
        share_for_site
      else
        share_for_gem
      end
    end

    def share_for_site
      @specs = Bundler.setup.specs
      @authors = {}
      @specs.each { |sp| @authors[sp.name] = sp.authors }
      thanks = ''
      @authors.each do |gem, authors|
        who = \
          if authors.count > 1
            'these cool and creative people'
          else
            'this cool and creative person'
          end
        what = "this awesome gem - #{gem}"
        b = binding
        thanks << ERB.new(THANKS).result(b)
      end
      b = binding
      File.open('./public/love.html', 'w+') do |f|
        f.write ERB.new(TEMPLATE).result(b)
      end
    end

    def share_for_gem

    end

    def parse_gemfile

    end

  end
end
