class Song
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all = []
  end

def self.name
  @name
end

def self.all
  @@all
end

def self.destroy_all
  @@all.destroy
end

def self.save
  @@all << self
end

def create
end


end
