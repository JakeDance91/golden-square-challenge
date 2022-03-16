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
  it "returns true if the entry contains a mobile number" do
    entry = DiaryEntry.new("Friday", "I met Dave, his phone number is 07845123123.")
    expect(entry.mobile_number).to eq "07845123123"
  end

  it "returns false if the entry does not contain a mobile number" do
    entry = DiaryEntry.new("Saturday", "I went to the cinema and had a lovely time.")
    expect(entry.mobile_number).to eq nil
  end

  it "returns entry in specific format" do
    new_entry = DiaryEntry.new("My Title", "This is five words long")
    result = new_entry.format
    expect(result).to eq "Title: #{"My Title"}. Entry: #{"This is five words long"}\n"
  end
end