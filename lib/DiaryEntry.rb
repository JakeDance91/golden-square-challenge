class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest_point = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    words = contents.split(" ")
    return words.count 
  end

  def reading_time(wpm) 
    time_taken = ((60.to_f/wpm) * count_words) / 60

    if time_taken == 1.0
      return "#{time_taken.round()} minute"
    elsif time_taken > 0
      return "#{time_taken.round(2)} minutes"
    else
      return "No text has been entered."
    end
  end

  def reading_chunk(wpm, minutes) 
    chunk_size = wpm * minutes
    start_from = @furthest_point
    ends_at = @furthest_point + chunk_size
    word_list = words[start_from..(ends_at - 1)]
      if ends_at >= count_words 
       @furthest_point = 0
      else
       @furthest_point = ends_at
      end  
      return word_list.join(" ")
  end  
end

def words
  words = contents.split(" ")
end