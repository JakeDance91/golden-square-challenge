def check_grammar(text)
  fail "No input." if text.empty?
  first_letter_is_uppercase = text[0] == text[0].upcase
  last_character_is_valid = [".", "!", "?"].include? text[-1]
  if first_letter_is_uppercase && last_character_is_valid
    return true
  else
    return false
  end
end
