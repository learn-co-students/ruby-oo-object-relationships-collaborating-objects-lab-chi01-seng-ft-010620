require "pry"
class MP3Importer
    attr_reader :path
    @@all = []

    def initialize(path)
        @path = path
        @@all << self
    end

    #loads all the mp3 files in the path directory
    #normalizes the filename to just the mp3 filename with no path
    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
      
    end


    def import 
        files.each {|f| Song.new_by_filename(f)}
    end

end