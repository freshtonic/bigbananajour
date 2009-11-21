module BigBananajour
  module EmailMangleHelper
    def demangle_email(email)
      email.gsub(/_at_/, "@").gsub(/_dot_/, ".")
    end
    def mangle_email(email)
      email.gsub(/@/, "_at_").gsub(/\./, "_dot_")
    end
  end
end
