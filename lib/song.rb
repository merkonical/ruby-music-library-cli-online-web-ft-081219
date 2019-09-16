class Song
  attr_accessor :name #retrieves and sets the name of a song
  attr_reader :artist, :genre  #returns the artist and genre of the song 
  
  
  @@all = []  #initialize as an empty array
  
  def initialize(name, artist = nil, genre = nil)  #optional argument to artist and genre 
    @name = name  #accepts a name for the new song
    self.artist = artist if artist  #Artist object assigned to the song's artist property 
    self.genre = genre if genre     
  end                     
  
  def artist=(artist)   #assigns an artist to the song 
    @artist = artist
    artist.add_song(self) #invokes Artist add_song to add itself to the artist's collection of songs 
  end 
  
  def genre=(genre)
    @genre = genre    #assigns genre property
    genre.songs << self unless genre.songs.include?(self) #adds the song to the genre's collection of songs 
  end                                         #does not add if it already exists
  
  def self.all  #returns the class variable @@all
    @@all 
  end 
  
  def self.destroy_all  #resets the @@all class variable to an empty array 
    all.clear 
  end 
  
  def save  #adds the Song instance to the @@all class variable
    self.class.all << self  
  end 
  
  def self.create(name)
    song = new(name)
    song.save           #saves the song
    song                #returns the song 
  end 

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end 
end 


























