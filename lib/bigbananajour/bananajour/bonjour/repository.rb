class Bananajour::Bonjour::Repository

  attr_accessor :name, :uri, :ismirror, :person 

  def initialize(name, uri, person)
    @name, @uri, @person = name, uri, person
  end
  
end
