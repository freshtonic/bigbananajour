# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bigbananajour}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Sadler"]
  s.date = %q{2009-11-20}
  s.default_executable = %q{bigbananajour}
  s.description = %q{Bananajour mirroring FTW!}
  s.email = %q{freshtonic@gmail.com}
  s.executables = ["bigbananajour"]
  s.extra_rdoc_files = ["Readme.md"]
  s.files = ["Readme.md", "Rakefile", "bin/bigbananajour", "lib/bigbananajour", "lib/bigbananajour/bananajour", "lib/bigbananajour/bananajour/bananajour.rb", "lib/bigbananajour/bananajour/bonjour", "lib/bigbananajour/bananajour/bonjour/advertiser.rb", "lib/bigbananajour/bananajour/bonjour/repository.rb", "lib/bigbananajour/bananajour/bonjour/repository_browser.rb", "lib/bigbananajour/bananajour/commands.rb", "lib/bigbananajour/bananajour/repository.rb", "lib/bigbananajour/eater.rb", "lib/bigbananajour/gem_dependencies.rb", "lib/bigbananajour/version.rb", "lib/bigbananajour.rb", "sinatra/app.rb", "sinatra/lib", "sinatra/lib/browsers.rb", "sinatra/lib/diff_helpers.rb", "sinatra/lib/mock_browsers.rb", "sinatra/public", "sinatra/public/jquery-1.3.2.min.js", "sinatra/public/loader.gif", "sinatra/public/logo.png", "sinatra/public/pbjt.swf", "sinatra/public/peanut.png", "sinatra/views", "sinatra/views/commit.haml", "sinatra/views/home.haml", "sinatra/views/layout.haml", "sinatra/views/readme.haml"]
  s.homepage = %q{http://github.com/freshtonic/bigbananajour}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Bananajour mirroring FTW!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bananajour>, ["= 2.2.2"])
      s.add_runtime_dependency(%q<sinatra>, ["= 0.9.4"])
      s.add_runtime_dependency(%q<json>, ["= 1.1.7"])
      s.add_runtime_dependency(%q<fancypath>, ["= 0.5.13"])
      s.add_runtime_dependency(%q<rainbow>, ["= 1.0.1"])
      s.add_runtime_dependency(%q<grit>, ["= 1.1.1"])
      s.add_runtime_dependency(%q<dnssd>, ["= 1.3.1"])
      s.add_runtime_dependency(%q<rack>, ["= 1.0.0"])
      s.add_runtime_dependency(%q<thin>, ["= 1.0.0"])
      s.add_runtime_dependency(%q<haml>, ["= 2.0.9"])
      s.add_runtime_dependency(%q<activesupport>, ["= 2.3.2"])
    else
      s.add_dependency(%q<bananajour>, ["= 2.2.2"])
      s.add_dependency(%q<sinatra>, ["= 0.9.4"])
      s.add_dependency(%q<json>, ["= 1.1.7"])
      s.add_dependency(%q<fancypath>, ["= 0.5.13"])
      s.add_dependency(%q<rainbow>, ["= 1.0.1"])
      s.add_dependency(%q<grit>, ["= 1.1.1"])
      s.add_dependency(%q<dnssd>, ["= 1.3.1"])
      s.add_dependency(%q<rack>, ["= 1.0.0"])
      s.add_dependency(%q<thin>, ["= 1.0.0"])
      s.add_dependency(%q<haml>, ["= 2.0.9"])
      s.add_dependency(%q<activesupport>, ["= 2.3.2"])
    end
  else
    s.add_dependency(%q<bananajour>, ["= 2.2.2"])
    s.add_dependency(%q<sinatra>, ["= 0.9.4"])
    s.add_dependency(%q<json>, ["= 1.1.7"])
    s.add_dependency(%q<fancypath>, ["= 0.5.13"])
    s.add_dependency(%q<rainbow>, ["= 1.0.1"])
    s.add_dependency(%q<grit>, ["= 1.1.1"])
    s.add_dependency(%q<dnssd>, ["= 1.3.1"])
    s.add_dependency(%q<rack>, ["= 1.0.0"])
    s.add_dependency(%q<thin>, ["= 1.0.0"])
    s.add_dependency(%q<haml>, ["= 2.0.9"])
    s.add_dependency(%q<activesupport>, ["= 2.3.2"])
  end
end
