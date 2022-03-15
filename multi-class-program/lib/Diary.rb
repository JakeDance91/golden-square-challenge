class Diary
  def initialize
  @list = []
  @contact_no = []
  end
  
  def add(diary_entry)
    @list << diary_entry
  # adds new instance of DiaryEntry to @list array
  end
  
  def read
    @list
  # returns list of diary entries as an array
  end
  
  def read_within_time(wpm, minutes)
    readable_entries(wpm, minutes).max_by do |entry| 
      entry.count_words
    end
  # returns most suitable diary entry to read within time limit in minutes
  # and a words per minute reading speed
  end
  
  def readable_entries(wpm, minutes)
    return @list.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  # searches through the array and removes any that exceed parameters
  end
  
  def contact_list
  # searches all diary entries for mobile number within the string and pushes to @contact_no
  # returns @contact_no
  end
end