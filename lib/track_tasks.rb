def track_tasks(text)
  fail "Please enter task." if text.empty?
  if text.include? "@TODO"
    return true
  else
    return false  
  end
end  
