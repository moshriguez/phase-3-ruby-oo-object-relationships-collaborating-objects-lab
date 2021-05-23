class Song

    @@all = []

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        filename_array = filename.split(" - ")
        new_song = self.new(filename_array[1])
        new_song.artist_name = (filename_array[0])
        new_song
    end

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
        artist
    end

end