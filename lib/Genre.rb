class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def artists
    self.songs.map { |song| song.artist }.uniq
  end
  
end