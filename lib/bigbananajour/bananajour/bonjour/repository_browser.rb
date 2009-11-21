module Bananajour::Bonjour
class RepositoryBrowser

  def repositories
    @browser.replies.map do |reply|
      Repository.new(
        reply.text_record["name"],
        reply.text_record["uri"],
        Person.new(
          reply.text_record["bjour-name"],
          reply.text_record["bjour-email"],
          reply.text_record["bjour-uri"],
          reply.text_record["bjour-gravatar"]
        )
      )
    end
  end
end
end
