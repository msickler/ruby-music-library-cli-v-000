class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.name
    @name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect { |n| n.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    s_name = filename.split(" - ")[1]
    s_artist = filename.split(" - ")[0]
    s_genre = filename.split(" - ")[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(s_artist)
    genre = Genre.find_or_create_by_name(s_genre)
    song = self.new(s_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end 
end
