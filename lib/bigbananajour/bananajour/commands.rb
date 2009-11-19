module Bananajour::Commands

  def serve_web!
    pid = fork { exec "/usr/bin/env ruby #{File.dirname(__FILE__)}/../../sinatra/app.rb -p #{web_port} -e production" }
    puts "* Started " + web_uri.foreground(:yellow)
    pid
  end

  def serve_git!
    pid = fork { exec "git daemon --base-path=#{repositories_path} --export-all --port=#{git_port}" }
    puts "* Started " + "#{git_uri}".foreground(:yellow)
    pid
  end

  def advertise!
    pid = fork { Bananajour::Bonjour::Advertiser.new.go! }
    pid
  end

  def eat_me_some_bananas!
    pid = fork { Bananajour::Eater.new.go! }
    pid
  end

end
