# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wherever/version"

Gem::Specification.new do |s|

  s.name        = "wherever"
  s.version     = Wherever::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Williams"]
  s.email       = ["mdub@dogbiscuit.org"]
  s.homepage    = ""
  s.summary     = %q{Provides syntax sugar for Ruby predicate blocks}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
