class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        attributes = filename.split(' - ')
        name = attributes[1]
        artist = attributes[0]
        new_song = Song.new(name)
        new_artist = Artist.new(artist)
        new_song.artist = new_artist
        new_song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end

end