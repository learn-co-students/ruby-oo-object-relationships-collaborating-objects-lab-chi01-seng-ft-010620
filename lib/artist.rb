require 'pry'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(name)
        name.artist = self
    end

    def self.find_or_create_by_name(name)
        if @@all.find do |artist|
            artist.name == name
            end
        @@all.find do |artist|
        artist.name == name
            end
        else
        Artist.new(name)
        end
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

end