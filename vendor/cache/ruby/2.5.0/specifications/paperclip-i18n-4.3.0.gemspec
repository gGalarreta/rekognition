# -*- encoding: utf-8 -*-
# stub: paperclip-i18n 4.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "paperclip-i18n".freeze
  s.version = "4.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tute Costa".freeze]
  s.date = "2016-08-01"
  s.description = "Translations for paperclip rubygem.".freeze
  s.email = ["tute@thoughtbot.com".freeze]
  s.homepage = "https://github.com/thoughbot/paperclip-i18n".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Translations for paperclip rubygem.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<i18n-spec>.freeze, ["~> 0.6.0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<i18n-spec>.freeze, ["~> 0.6.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<i18n-spec>.freeze, ["~> 0.6.0"])
  end
end
