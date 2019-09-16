class MusicImporter
  attr_reader :path

  def initialize(path)    #accepts a file path to parse MP3 files from
    @path = path          # retrieves the path provided to the MusicImporter object
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }  #loads all the MP3 files in the path directory normalizes the filename to just the MP3 filename with no path
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }  #imports the files into the library by invoking Song.create_from_filename
  end
end