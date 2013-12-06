# vim: ft=ruby

Gem::Specification.new do |s|
  s.name        = "aws-data"
  s.version     = "0.1.0"
  s.authors     = ["Richo Healey"]
  s.email       = ["richo@psych0tik.net"]
  s.homepage    = "http://github.com/richo/aws-data"
  s.summary     = "Fetch instance data from AWS"
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end


