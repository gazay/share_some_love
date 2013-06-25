require 'bundler'
require 'pathname'
require 'erb'
require 'yaml'

module Love
  class << self

    attr_reader :by_gemname, :for_site, :gems, :authors, :root, :lang

    def share_for(args)
      by_gemname = args.include? 'by_gem'
      for_site = args.include? 'site'

      @by_gemname = by_gemname
      @for_site = for_site
      @root = Pathname(__FILE__).parent
      @lang = 'en'
      @gems = []
      @authors = []

      lets_start_from_heart!

      parse_gemfile
      share_love
    end

    def lets_start_from_heart!
      puts File.read(Love.root.join '../hearts/ascii1.txt')
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
        Love::Share.md by_gemname
      end
    end

  end
end

require 'love/author'
require 'love/gem'
require 'love/thank_words'
require 'love/share'
