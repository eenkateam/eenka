# -*- encoding: utf-8 -*-
# stub: kakurenbo-puti 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kakurenbo-puti".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["alfa-jpn".freeze]
  s.date = "2016-09-17"
  s.description = "    kakurenbo-puti provides an ActiveRecord-friendly soft-delete gem.\n    This gem does not override methods of ActiveRecord.\n\n    I think that kakurenbo-puti is cho-iketeru! (very cool!)\n".freeze
  s.email = ["a.nkmr.ja@gmail.com".freeze]
  s.homepage = "https://github.com/alfa-jpn/kakurenbo-puti".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Lightweight soft-delete gem.".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.7.8"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 4.1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.7.8"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.7.8"])
  end
end
