libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "bananajour"

# Bananajour monkeypatches.
require 'bigbananajour/bananajour/bananajour'
require 'bigbananajour/bananajour/commands'
require 'bigbananajour/bananajour/repository'
require 'bigbananajour/bananajour/bonjour/advertiser'
require 'bigbananajour/bananajour/bonjour/repository'
require 'bigbananajour/bananajour/bonjour/repository_browser'

require 'bigbananajour/eater'

module BigBananajour
  
  class << self

    include DateHelpers
    include GravatarHelpers
    include BigBigBananajourHelpers
    include Commands

    def big?
      ENV["BIG_BANANA_MODE"] == "true"
    end

    def setup?
      repositories_path.exists?
    end
    
    def setup!
      repositories_path.create_dir
    end
    
    def path
      Fancypath("~/.bigbananajour").expand_path
    end
    
    def repositories_path
      big? ? path/"mirrored_repositories" : path/"repositories"
    end

    def get_git_global_config(key)
      `git config --global #{key}`.strip
    end
    
    def config
      @config ||= begin
        OpenStruct.new({
          :name => get_git_global_config("user.name"),
          :email => get_git_global_config("user.email")
        })
      end
    end
    
    def web_port
      big? ? 9332 : 9331
    end
    
    def web_uri
      "http://#{host_name}:#{web_port}/"
    end

    def git_port
      big? ? 9419 : 9418
    end

    def host_name
      hn = get_git_global_config("bigbananajour.hostname")
      unless hn.nil? or hn.empty?
        return hn
      end

      hn = Socket.gethostname

      # if there is more than one period in the hostname then assume it's a FQDN
      # and the user knows what they're doing
      return hn if hn.count('.') > 1

      if hn =~ /\.local$/
        hn
      else
        hn + ".local"
      end
    end
    
    def git_uri
      "git://#{host_name}:#{git_port}/"
    end

    def repositories
      if BigBananajour.big?
        repositories_path.children.map {|dir| Fancypath(dir).children.map{|r| Repository.new(r)}.sort_by{|r| r.name}}.flatten
      else
        repositories_path.children.map {|r| Repository.new(r)}.sort_by {|r| r.name}
      end
    end

    def repository_names
      repositories.map{|r| r.name}.uniq
    end

    def people_that_have_repository(repository_name)
      repositories.select{|r| r.name == repository_name}.map{|r| demangle_email(r.path.expand_path.to_s.split("/")[-2]) }.sort
    end

    def repository(name)
      repositories.find {|r| r.name == name}
    end
    
    def to_hash
      {
        "name" => config.name,
        "email" => config.email,
        "uri"  => web_uri,
        "git-uri" => git_uri,
        "gravatar" => BigBananajour.gravatar,
        "version" => BigBananajour::VERSION,
        "repositories" => repositories.collect do |r|
          {"name" => r.name, "uri" => r.uri}
        end
      }
    end
    
  end
  
end
