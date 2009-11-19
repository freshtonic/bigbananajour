class Bananajour::Bonjour::Advertiser
  private
    def register_app
      STDOUT.puts "Registering #{Bananajour.web_uri}"
      tr = DNSSD::TextRecord.new
      tr["name"] = Bananajour.config.name
      tr["email"] = Bananajour.config.email
      tr["uri"] = Bananajour.web_uri
      tr["gravatar"] = Bananajour.gravatar
      tr["version"] = Bananajour::VERSION
      tr["ismirror"] = Bananajour.big?.to_s
      DNSSD.register("#{Bananajour.config.name}'s bananajour", "_http._tcp,_bananajour", nil, Bananajour.web_port, tr) {}
    end
    def register_new_repositories
      new_repositories.each do |new_repo|
        STDOUT.puts "Registering #{new_repo.uri}"
        tr = DNSSD::TextRecord.new
        tr["name"] = new_repo.name
        tr["uri"] = new_repo.uri
        tr["ismirror"] = Bananajour.big?.to_s
        tr["bjour-name"] = Bananajour.config.name
        tr["bjour-email"] = Bananajour.config.email
        tr["bjour-uri"] = Bananajour.web_uri
        tr["bjour-gravatar"] = Bananajour.gravatar
        tr["bjour-version"] = Bananajour::VERSION
        service = DNSSD.register(new_repo.name, "_git._tcp,_bananajour", nil, Bananajour.git_port, tr) {}
        service.class.instance_eval { attr_accessor(:repository) }
        service.repository = new_repo
        @services << service
      end
    end
end
