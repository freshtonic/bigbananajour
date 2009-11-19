Bananajour.require_gem 'grit'

module Bananajour
  class Repository
    def uri
      Bananajour.git_uri + path.expand_path.to_s.split("/")[-2..-1].join("/")
    end
  end
end
