class Bananajour::Eater
  def initialize
    @browser = Bananajour::Bonjour::RepositoryBrowser.new
  end
  def go!
    $stderr.puts "Starting the EATER!!!"
    while true do
      @browser.repositories.each do |remote_repo|
        $stderr.puts "Eater has seen remote repo '#{remote_repo}'"
        local_repo = Bananajour::Repository.for_name(make_local_repo_name(remote_repo))
        if local_repo.exists?
          $stderr.puts "Eater, fetching changes from remote repo #{remote_repo.name}"
          fetch_latest(local_repo)
          capture_personal_details(local_repo, remote_repo)
        else
          $stderr.puts "Eater, cloning remote repo #{remote_repo.name}"
          clone_repo(remote_repo)
          fetch_latest(local_repo)
          capture_personal_details(local_repo, remote_repo)
        end
      end
      $stderr.puts "Eater thread SLEEPING"
      sleep 30
    end
    $stderr.puts "Eater thread exiting."
  end
  private
  def fetch_latest(repo)
    # Grit doesn't do fetching(!) so, we'll invoke this ourselves.
    # Note: the repo's were created with git --mirror
    # This means that when when we do git fetch, it's actually updating the BRANCHES.
    # This is so that git clone will create remote refs in the cloned repo.
    `cd #{repo.path} && git fetch -f`
  end
  def clone_repo(remote_repo)
    # FYI: git clone --bare doesn't add the remote 'origin', need to do it manually.
    system(["cd #{Bananajour.repositories_path}",
    "(mkdir #{sanitize_email(remote_repo.person.email)} || true)",
    "git clone --mirror #{remote_repo.uri} #{make_local_repo_name(remote_repo)}.git"
    ].join(" && "))
  end
  # TODO: Re-use the helper version
  def sanitize_email(email)
    email.gsub(/@/, "_at_").gsub(/\./, "_dot_")
  end
  def make_local_repo_name(remote_repo)
    sanitize_email(remote_repo.person.email) + "/" + remote_repo.name
  end
  def capture_personal_details(local_repo, remote_repo)
    $stderr.puts "capturing personal details for #{local_repo.path}"
    local_repo.set_config("bigbananajour.gravatar", remote_repo.person.gravatar)
    local_repo.set_config("bigbananajour.person", remote_repo.person.name)
  end
end
