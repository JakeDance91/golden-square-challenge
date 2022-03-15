require "DiaryEntry"

RSpec.describe DiaryEntry do 
  it "returns number of words in the contents string" do
    new_entry = DiaryEntry.new("My Title", "This is five words long")
    result = new_entry.count_words
    expect(result).to eq 5
  end
  it "returns time taken to read a string given the words per minute parameter" do
    new_entry = DiaryEntry.new("My Title", "This is now much much longer, and it is eleven words.")
    result = new_entry.reading_time(11)
    expect(result).to eq 1
  end
end