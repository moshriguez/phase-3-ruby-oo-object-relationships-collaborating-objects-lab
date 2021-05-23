require 'pry'
class Artist

    @@all = []

    def self.all
        @@all
    end

    def self.find_or_create_by_name(artist_name)
        if self.all.find {|artist| artist.name == artist_name}
            self.all.find {|artist| artist.name == artist_name}
        else
            self.new(artist_name)
        end
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        puts self.songs.collect {|song| song.name}
    end

end

