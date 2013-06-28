# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "love/version"

Gem::Specification.new do |s|
  s.name        = "share_some_love"
  s.version     = Love::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['gazay']
  s.email       = ['alex.gaziev@gmail.com']
  s.homepage    = "https://github.com/gazay/share_some_love"
  s.summary     = %q{I want you to share some love to OSS developers!}
  s.description = %q{If you ever wander to say thank you to guys who did this great job on your gem or your project parts - it's really great opportunity}

  s.rubyforge_project = "share_some_love"

  s.add_dependency 'bundler'
  s.add_dependency 'octokit'
  s.add_dependency 'highline'

  s.add_development_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
