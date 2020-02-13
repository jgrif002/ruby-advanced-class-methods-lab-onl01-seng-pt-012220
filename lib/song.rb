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
  
  def self.new_by_name(song_name) 
    song = self.new 
    song.name = song_name 
    song 
  end 
  
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save 
    song 
  end 
  
  def self.find_by_name(name) 
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name) 
    find_create = self.find_by_name(name)
      if find_create 
        find_create 
      else 
        self.create_by_name(name)
      end
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[1] = song_info[1].chomp(".mp3")
    song = self.new 
    song.artist_name = song_info[0] 
    song.name = song_info[1]
    song 
  end 

end
