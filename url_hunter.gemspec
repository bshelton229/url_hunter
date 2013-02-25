# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_hunter"

Gem::Specification.new do |s|
  s.name        = "url_hunter"
  s.version     = UrlHunter::VERSION
  s.authors     = ["Bryan Shelton"]
  s.email       = ["bryan@sheltonopensolutions.com"]
  s.homepage    = "https://github.com/bshelton229/url_hunter"
  s.summary     = %q{Resolves URL re-directs given a limit}
  s.description = %q{Wait a minute, before I go anywhere with you, I want to know where you're taking me.}

  s.rubyforge_project = "url_hunter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency('rspec')
  s.add_development_dependency('rake')
end
