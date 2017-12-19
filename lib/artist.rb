class Artist
  extend Concerns::Findable 
  
  attr_accessor :name, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end


end
