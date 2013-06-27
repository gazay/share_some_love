require 'bundler'
require 'octokit'
require 'pathname'
require 'erb'
require 'yaml'

module Love
  class << self

    attr_reader :by_gemname, :for_site, :root, :lang, :octokit, :check_author
    attr_accessor :gems, :authors

    def share_for(args)
      @by_gemname = args.include? 'by_gem'
      @for_site = args.include? 'site'
      @check_author = args.include? '-v'
      @root = Pathname(__FILE__).parent
      @lang = 'en'
      @gems = []
      @authors = []

      lets_start_from_heart!

      login_user

      parse_gemfile
      share_love
    end

    def login_user
      puts 'Please, enter your github credentials that Octokit could work without github guest requests restrictions'
      puts 'login:'
      login = $stdin.gets.chomp
      puts 'password:'
      pass = $stdin.gets.chomp
      @octokit = Octokit::Client.new login: login, password: pass
    end

    def lets_start_from_heart!
      puts File.read(Love.root.join '../hearts/ascii1.txt')
    end

    def parse_gemfile
      Bundler.load.specs.each do |spec|
        gem = Love::Gem.new(spec)
        @gems << gem
      end
    end

    def share_love
      if for_site
        Love::Share.html by_gemname
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
