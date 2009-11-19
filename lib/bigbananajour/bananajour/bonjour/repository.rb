class Bananajour::Bonjour::Repository

  attr_accessor :name, :uri, :ismirror, :person 

  def initialize(name, uri, ismirror, person)
    @name, @uri, @ismirror, @person = name, uri, ismirror, person
  end
  
end
