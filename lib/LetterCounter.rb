class LetterCounter
  def initialize(text)
    @text = text.downcase
  end

  def calculate_most_common()
    counter = Hash.new(0)
    most_common = nil
    most_common_count = 0
    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char] || 0) + 1
      if counter[char] > most_common_count
        most_common = char
        most_common_count = counter[char]
      end
    end
    return [most_common_count, most_common]
    
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

counter2 = LetterCounter.new("I can't think of a serious line to put here")
p counter2.calculate_most_common

counter3 = LetterCounter.new("MMMMmmmmmmmmmeee")
p counter3.calculate_most_common
# Intended output:
# [2, "i"]