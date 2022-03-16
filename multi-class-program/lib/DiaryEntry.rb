class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @mobile_number = has_mobile_number?(@contents)
  end
  
  def title
    @title
  end
  
  def contents 
    @contents
  end

  def format
    "Title: #{@title}. Entry: #{@contents}\n"    
  end
  
  def count_words
    words = contents.split(" ")
    return words.count
  end
  
  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

  def mobile_number
    @mobile_number
  end

  def has_mobile_number?(contents)
    contents.split.each do |word|
      if (word[-1] == ".") || (word[-1] == "!") || (word[-1] == "?") || (word[-1] == ",")
        word.chop!
      end
      if (word.length == 11) && (word[0] == "0") && (word[1] == "7") && (word !~ /\D/)
        return word
      end
    end
    return nil
  end

  # def search_number
  #   contents.scan(/\d/).join
  # end
end

# search_number
# # contents.each do |item|
#   item.scan

#   if search_number = true
#     @array << item
#   end

