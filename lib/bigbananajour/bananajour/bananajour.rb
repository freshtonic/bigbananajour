
# Monkeypatch bananajour to override ports
# and repository resolution behaviour.
module Bananajour
  
  class << self
    
    def repositories_path
      path/"mirrored_repositories"
    end

    def web_port
      9332 
    end
    
    def git_port
      9419 
    end

    def git_uri
      "git://#{host_name}:#{git_port}/"
    end

    def repositories
      repositories_path.children.map {|dir| Fancypath(dir).children.map{|r| Repository.new(r)}.sort_by{|r| r.name}}.flatten
    end

    def people_that_have_repository(repository_name)
      repositories.select{|r| r.name == repository_name}.map{|r| demangle_email(r.path.expand_path.to_s.split("/")[-2]) }.sort
    end
  end
end
