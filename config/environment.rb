require 'bundler'
Bundler.require

module Concerns       #configure environment for Concerns::Findable 
  module Findable
    def find_by_name(name)
      self.all.detect {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name).nil?
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  end
end

require_all 'lib'
