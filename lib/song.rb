class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    result = nil
    @@all.each do |song|
      result = song if song.name == name
    end
    result
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) ||
    Song.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |a| a.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(/[^a-zA-z\s]|\s-\s/)[1]
    song.artist_name = filename.split(/[^a-zA-z\s]|\s-\s/)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(/[^a-zA-z\s]|\s-\s/)[1]
    song.artist_name = filename.split(/[^a-zA-z\s]|\s-\s/)[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
