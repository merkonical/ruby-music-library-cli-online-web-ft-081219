class Artist 
  extend Concerns::Findable #extends the module 
  
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []  #songs to an empty array 
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
    artist = new(name)
    artist.save 
    artist 
  end 
  
  def add_song(song)    #method assigns current artis to the song's artist property
    song.artist = self unless song.artist   #does not assign the artist if the song already has an artist 
    songs << song unless songs.include?(song)   #adds the song to the current artist's song collection
  end                                 #does not add the song to the current artist's collection of songs if it already exists therein

  def genres 
    songs.collect{ |s| s.genre }.uniq     #returns collection of genres for all of the artist's songs/ does not return duplicate genres/ collects genres
  end
end


















