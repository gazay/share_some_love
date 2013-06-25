require 'bundler'
require 'pathname'

class Love

  def self.share_for(args)
    by_gemname = args.include? 'by_gem'
    for_site = args.include? 'site'

    self.lets_start_from_heart!

    self.new by_gemname, for_site
  end

  def self.lets_start_from_heart!
    puts File.read('./hearts/ascii1.txt')
  end

  attr_reader :by_gemname, :for_site, :gems, :authors, :root

  def initialize(by_gemname, for_site)
    @by_gemname = by_gemname
    @for_site = for_site
    @root = Pathname(__FILE__).parent

    parse_gemfile
    share_love
  end

  def parse_gemfile
    Bundler.setup.specs.each do |spec|
      gem = Love::Gem.new(spec)
      @gems << gem
      @authors << gem.authors
    end
    @authors = @authors.flatten.uniq
  end

  def share_love
    if for_site
      Love::Site.create_file
    else
      Love::Gem.create_file
    end
  end

end
