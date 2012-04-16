# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "naughty_maze/version"

Gem::Specification.new do |s|
  s.name        = "naughty_maze"
  s.version     = NaughtyMaze::VERSION
  s.authors     = ["Venelin Valkov"]
  s.email       = %w(venelin@naughtyspirit.com)
  s.homepage    = ""
  s.summary     = %q{Random Maze Solver}
  s.description = %q{Maze solver written in Ruby. Using A* algorithms}

  s.rubyforge_project = "naughty_maze"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  # specify any dependencies here; for example:
  s.add_dependency "algorithms"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  # s.add_runtime_dependency "rest-client"
end
