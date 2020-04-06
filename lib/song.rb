require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # class method self = class Song
  # read the instance data stored in @@all
  # class variables are precious organs. always protect it in a method so it does not accidentally get altered. 
  def self.all 
   @@all
  end
  
  # instance method 
  #self = instance, song
  # as soon as an instance is created, put it into @@all array
  # in this case we had to use self.class.all instead of self.all because we can have only have one identity for self in a method
  # this is an instance method and we have to specify that an instance goes into the array.
    # so syntax must coincide with self being an instance, not a class. 
  def save 
    self.class.all << self 
  end

  # class constructor - called whenever an instance of the class is created
  # Every time a song is created, save it into @@all array
    #self = class Song
  #1 create an instance, song
  #2 use instance method that stores song to @@all array.
  #3 return song instance that was instantiated and saved in the array.
  def self.create
    song = Song.new #1
    song.save #2
    song #3
  end 
  
  # class constructor - called whenever an instance of the class is created
  # Every time an instance song is created, take the string name passed through the argument and set its name as that string name. 
  # self = class Song
  #1 Create an isntance, song
  #2 call name method on a song, set that equal to song_name that is passed as an argument
  #3 return song instance with that name set as its name property

  def self.new_by_name(song_name) 
    song = self.new #1
    song.name = song_name #2
    song #3
  end
  
  # class constructor - called whenever an instance of the class is created
  #1 every time an instance song is created, save it to @@all array 
  #2 AND save the song_name string passed through as argument as its name attribute. 
  #3 return the song instance that has been saved into @@all array and with the song_anme string saved as its name attribute. 
  def self.create_by_name(song_name) 
    song = self.create #1
    song.name = song_name #2
    song #3
  end 

  # class finder - find instance of a class
  # self = class, Song
  # you are looking whether the song_name you input is in your music library (@@all)
  # apply find function to the library - self.all 
  # library is an array. name element of the array as song.
  # call song.name method to say if the song_name passed through the argument is equal to name of the song in the array, return that song
  def self.find_by_name (song_name)
    self.all.find{|song| song.name ==song_name}
  end

  # Create a feature 
    # To avoid creating duplicateswhile we create instance songs in our library
    # check to see if we have the song
      # if we do, it will return the song name
      # if we don't, it will create a song 
  # we have both functions built in find and create
  # combine those together || means or
  def self.find_or_create_by_name (song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  

# Sort the library
# Class method 
  # self = Song
# apply sort_by method to the library(self.all)
  # libary is an array. name single element in a pipe.
  # specify that you want to alphabetize by song name.
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 

  # class constructor
  # filename = "artist_name - song_name.mp3"
 # When you receive a filename in above format, 
    #grab the artist_name and save it as artist name.
    # grab the song_name and save it as song name.
      # remove mp3
# instantiate a song
  # set its attributes to separated song_name and artist_name from the fileaname. 
#1 There are two parts of the filename we want to separate.
  # artist_name and song_name are separated by a -
    # use split(" - ") function to separate the two and put those into an array named parts.
      # save the artist_name, the first element of parts array as artist_name
      # save the song_name, the second element of parts array as song_name
        # remember that song_name still has .mp3 that we need to remove
          # use .gsub("what you want to remove from a string", "what you want to replace it with") method (g - global sub - substitute)
              #parts[1].gsub(".mp3", "")
                # from second element of parts array, substitute .mp3 with an empty space.
#2 Instantiate a song
  # set its song.name to the song_name you've separated from filename
  # set is artist_name to the artist_name you've separated from filename.
  def self.new_from_filename(filename)
    parts = filename.split(" - ") #1
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  
# class constructor very similar to the one above.
  #However, this one saves the newly created song with info from filename to the library.
    # we previous created a .create method where you automatically save the instance created to the library. 
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

# class method
  # self = class, SOng
  # delete the entire library
  # specify the libary you want to delete and apply clear method. 
  def self.destroy_all
    self.all.clear
  end
end
