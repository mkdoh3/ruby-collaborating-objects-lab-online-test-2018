# class Artist
#   attr_accessor :name, :songs
#   @@all = []
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#   def self.all
#     @@all
#   end
#   def add_song(song)
#     @songs << song
#   end

#   def save
#     self.class.all << self
#   end
#   def self.create(name)
#     self.new(name).tap(&:save)
#   end
#   def self.find(name)
#     self.all.detect { |artist| artist.name == name }
#   end

#   def find_or_create_by_name(name)
#     binding.pry
#     self.find(name) || Artist.create(name)
#   end
#   def print_songs
#     Song.all.filter { |song| song.artist == self }.each do |song|
#       puts song.name
#     end
#   end
# end

class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find { |artist| artist.name == name }
  end

  def self.create(name)
    self.new(name).tap(&:save)
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each { |song| puts song.name }
  end
end
