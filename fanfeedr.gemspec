# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fanfeedr/version"

Gem::Specification.new do |s|
  s.name        = "fanfeedr"
  s.version     = Fanfeedr::VERSION
  s.authors     = ["Johnny Khai Nguyen"]
  s.email       = ["johnnyn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby wrapper for the Fanfeedr API}
  s.description = %q{Use this to access the Fanfeedr API in your Ruby application}

  s.rubyforge_project = "fanfeedr_new"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httparty'
  s.add_dependency 'hashie'  
  s.add_dependency 'json'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'
end
