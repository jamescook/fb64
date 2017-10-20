Gem::Specification.new do |s|
  s.name    = "fb64"
  s.version = "1.0.0"
  s.summary = "Fast Base64 C extension"
  s.author  = "James Cook"
  s.homepage = "https://github.com/jamescook/fb64"

  s.files = Dir.glob("ext/**/*.{c,rb}") +
            Dir.glob("lib/**/*.rb")

  s.extensions << "ext/fb64/extconf.rb"
  s.licenses << "MIT"

  s.add_development_dependency "rake-compiler", "~> 1"
  s.add_development_dependency "minitest", "~> 5"
  s.add_development_dependency "benchmark-ips", "~> 2"
  s.required_ruby_version = '>= 2'
end
