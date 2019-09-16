module Concerns::Findable 
  def find_by_name(name)                  #is added as a class method to classes that extend the module isn't hard-coded
    self.all.detect{|s| s.name == name}   #searching the extended class's @@all variable for an instance that matches the provided name
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end 