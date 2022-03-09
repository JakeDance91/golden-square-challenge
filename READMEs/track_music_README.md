1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

``` ruby

# add artist and song - push to hash with key(artist) and key(song)
# as both will be added at the same time, can call upon them to be returned as a list? indexed. 
class Track_Music
  def initialize
    # initialize a hash to contain key value pairs of music artists and songs
  end

  def add_song(artist, song) # artist and song are two independent strings
    # push key value pair to hash
  end

  def list
    # returns list as hash
  end
end

```
3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

``` ruby

music_library = Track_Music.new
music_library.add_song("Tim Henson", "Blood moon")
music_library.list # => "Tim Henson, Blood moon"

# 2
music_library = Track_Music.new
music_library.add_song("") # fails with "No information given"

# 3
music_library = Track_Music.new
music_library.add_song("Tim Henson", "Blood moon")
music_library.add_song("Sikth", "Bland Street Bloom")
music_library.list() # => ["Tim Henson", "Blood moon"]["Sikth", "Bland Street Bloom"]


```

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.