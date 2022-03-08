def reading_time(string)
  words = string.split(" ")
  word_number = words.count 
  time_taken = ((60.to_f/200) * word_number) / 60

  if time_taken == 1.0
    return "#{time_taken.round()} minute"
  elsif time_taken > 0
    return "#{time_taken.round(2)} minutes"
  else
    return "No text has been entered."
  end
end  
