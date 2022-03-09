# add artist and song - push to hash with key(artist) and key(song)
# as both will be added at the same time, can call upon them to be returned as a list? indexed. 
class Track_Music
  def initialize
    @library = []
  end

  def add_song(artist, song) 
    fail "No information given." if artist.empty? && song.empty?
    @library.push({artist => song})
  end

  def list
    return @library
  end
end

