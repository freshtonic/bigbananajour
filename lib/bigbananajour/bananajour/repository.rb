Bananajour.require_gem 'grit'

module Bananajour
  class Repository
    def uri
      Bananajour.git_uri + path.expand_path.to_s.split("/")[-2..-1].join("/")
    end
    # TODO: put this in Bananajour.
    def get_config(key)
      `cd #{path} && git config --get #{key}`
    end
    def set_config(key,value)
      $stderr.puts "setting '#{key}' to '#{value}'"
      `cd #{path} && git config --unset-all #{key}`
      `cd #{path} && git config --replace-all #{key} "#{value}"`
    end
  end
end
