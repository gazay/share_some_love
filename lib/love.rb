require 'bundler'
require 'erb'

class Love

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

  def self.share_for(args)
    by_gemname = args.include? 'by_gem'
    for_site = args.include? 'site'

    self.new by_gemname, for_site
  end

  attr_reader :by_gemname, :for_site

  def initialize(by_gemname, for_site)
    @by_gemname = by_what
    parse_gemfile

    if for_site
      share_for_site
    else
      share_for_gem
    end
  end

  def share_for_site
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

  def share_for_gem

  end

  def parse_gemfile
    @gems_with_authors = {}
    @authors_with_gems = {}
    Bundler.setup.specs.each { |sp| @gems_with_authors[sp.name] = sp.authors }
    @gems_with_authors.each do |gem, authors|
      authors.each do |author|
        @authors_with_gems[author] ||= []
        @authors_with_gems[author] << gem
      end
    end
  end

  def thanks_by_gemname
    thanks = ''
    @gems_with_authors.each do |gem, authors|
      who = \
        if authors.count > 1
          "these cool and creative people: #{authors.join(', ')}"
        else
          "this cool and creative person #{authors.first}"
        end
      what = "this awesome gem - #{gem}"
      b = binding
      thanks << ERB.new(THANKS).result(b)
    end
    thanks
  end

  def thanks_by_author
    thanks = ''
    @authors_with_gems.each do |author, gems|
      who = "my mate #{author}"
      what = \
        if gems.count > 1
          "these great libraries: #{gems.join(', ')}! Wow man! You awesome!"
        else
          "this helpful and useful gem - #{gems.first}"
        end
      b = binding
      thanks << ERB.new(THANKS).result(b)
    end
    thanks
  end

end
