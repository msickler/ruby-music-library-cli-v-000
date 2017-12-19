class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.map { |name| name.gsub("#{path}/", "")  }
  end

  def self.import
    files.map { |name| Song.create_from_filename(name) }
  end

end
