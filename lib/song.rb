class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
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

  def self.save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end


end
