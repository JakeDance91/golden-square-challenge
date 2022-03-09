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

