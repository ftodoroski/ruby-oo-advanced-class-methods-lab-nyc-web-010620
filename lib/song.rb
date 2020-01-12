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

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    return self.find_by_name(song_name) if self.find_by_name(song_name)

    self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    full_song = file_name.slice(0...-4).split(" - ")
    song.artist_name = full_song[0]
    song.name = full_song[1]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    full_song = file_name.slice(0...-4).split(" - ")
    song.artist_name = full_song[0]
    song.name = full_song[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
