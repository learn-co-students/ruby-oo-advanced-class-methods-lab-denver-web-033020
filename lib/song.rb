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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(emptyName)
    song = Song.new
    song.name = emptyName
    song
  end

  def self.create_by_name(songName)
    song = Song.new
    song.name = songName
    self.all << song
    song
  end

  def self.find_by_name(findSong)
    #puts "FIND BY NAME IS #{self.all.find {|song| song.name == findSong}}"
    self.all.find {|song| song.name == findSong}
  end

  def self.find_or_create_by_name(providedSong)
    result = self.find_by_name(providedSong)
    if !result
      return self.create_by_name(providedSong)
    else
      return result
    end
  end

  def self.alphabetical
    @result = []
    @@all.map do |song|
      @result << song.name
    end
    @result = @result.sort

    alphabeticalArray = []

    @result.each do |n|
      alphabeticalArray << get_by_musician_name(n)
    end
    alphabeticalArray
  end

  def self.get_by_musician_name(inputSong)
    @@all.each do |n|
        if n.name == inputSong
            return n
        else puts "name not found"
        end
    end
  end

  def self.new_from_filename(input)
    splitInput = input.split(' - ')
    song = Song.new
    song.name = splitInput[1].split('.')[0]
    song.artist_name = splitInput[0]
    self.all << song
    song
  end

  def self.create_from_filename(input)
    splitInput = input.split(' - ')
    song = Song.new
    song.name = splitInput[1].split('.')[0]
    song.artist_name = splitInput[0]
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end


end
