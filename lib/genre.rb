class Genre 
  extend Concerns: :Findable
  
  attr_accessor :name 
  attr_reader :songs  #returns the genre's songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []   #songs property to an empty array 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    all.clear
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    genre = new(name)
    genre.save 
    genre 
  end 
  
  def artists 
    songs.collect{ |s| s.artist }.uniq    #returns a collection of artists/ does not return duplicate artists/ collects artist
  end 
end 






















