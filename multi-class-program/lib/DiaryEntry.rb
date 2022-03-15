class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end
  
  def title
    @title
  end
  
  def contents 
    @contents
  end
  
  def count_words
    words = contents.split(" ")
    return words.count
  end
  
  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

end