module Concerns::Findable 
  def find_by_name(name)                  #is added as a class method to classes that extend the module isn't hard-coded
    self.all.detect{|s| s.name == name}   #searching the extended class's @@all variable for an instance that matches the provided name
  end

  def find_or_create_by_name(name)                  #is added as a class method to classes that extend the module
    self.find_by_name(name) || self.create(name)  
                                                    #finds (does not recreate) an existing instance with the provided name if one exists in @@all isn't hard-codedinvokes .find_by_name instead of re-coding the same functionality invokes the extended class's .create method, passing in the provided name, if an existing match is not found
  end
end 