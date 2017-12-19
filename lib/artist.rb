class Artist
  attr_accessor :name, :song
  @@all = []

  def initialize(name)
    @name = name
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


end
