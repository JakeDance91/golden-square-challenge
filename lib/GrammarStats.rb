class GrammarStats
  def initialize
    @results = []
  end

  def check(text) # text is a string
    fail "No input." if text.empty?
    first_letter_is_uppercase = text[0] == text[0].upcase
    last_character_is_valid = [".", "!", "?"].include? text[-1]
      if first_letter_is_uppercase && last_character_is_valid
        @results.push(true)
        return true
      else
        @results.push(false)
        return false
      end
  end

  def percentage_good
    h = @results.tally
    percentage = ((h[true].to_f / (h[true] + h[false])) * 100).round()
    return "#{percentage} + %"
  end
end