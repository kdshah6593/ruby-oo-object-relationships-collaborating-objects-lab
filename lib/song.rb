require 'pry'
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
        # parse filename to find song name and artist
        song_name = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        # create new Song instance
        song = self.new(song_name)
        # Associate new song with appropriate artist. use artist accessor = artist instance
        #song.artist = song.artist_name=(artist_name)
        song.artist_name= artist_name
        # return new song instance
        song
    end

    def artist_name=(name) #takes in name gets the artist object
        self.artist = Artist.find_or_create_by_name(name) #turn artist's name as a string into Artist object
        
        self.artist.add_song(self) #Assign the song to the artist
    end

end