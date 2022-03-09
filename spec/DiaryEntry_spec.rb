require "DiaryEntry"

RSpec.describe DiaryEntry do
  it "adds and returns title as string" do
    diary_entry1 = DiaryEntry.new("The Hobbit", "word " * 95356)
    expect(diary_entry1.title).to eq "The Hobbit"
  end

  it "adds and returns contents as string" do
    diary_entry1 = DiaryEntry.new("The Hobbit", "word " * 95356)
    expect(diary_entry1.contents).to eq "word " * 95356
  end

  it "returns the number of words in the contents as an integer" do
    diary_entry1 = DiaryEntry.new("The Hobbit", "word " * 95356)
    expect(diary_entry1.count_words).to eq 95356
  end

  it "returns an estimated time to read contents based on user wpm" do
    diary_entry1 = DiaryEntry.new("The Hobbit", "word " * 95356)
    expect(diary_entry1.reading_time(200)).to eq "#{476.78} minutes"
  end

  it "returns a chunk of the string based on use wpm and time" do
    diary_entry1 = DiaryEntry.new("A Very Short Story", 
      "This is an extremely short story to see if a certain method works. That method involves splitting up a text into readable chunks. Let's see if that works!")
    expect(diary_entry1.reading_chunk(10, 1)).to eq "This is an extremely short story to see if a"
  end

  it "returns a second chunk of the string from the same point if reading_chunk called twice" do
    diary_entry1 = DiaryEntry.new("A Very Short Story", 
      "This is an extremely short story to see if a certain method works. That method involves splitting up a text into readable chunks. Let's see if that works!")
      diary_entry1.reading_chunk(10, 1)
      expect(diary_entry1.reading_chunk(10,1)).to eq "certain method works. That method involves splitting up a text"
    end

  it "returns the first chunk of string if text ends" do
    diary_entry1 = DiaryEntry.new("A Very Short Story", 
      "This is an extremely short story to see if a certain method works. That method involves splitting up a text into readable chunks. Let's see if that works!")
      diary_entry1.reading_chunk(10, 1)
      diary_entry1.reading_chunk(10, 1)
      diary_entry1.reading_chunk(10, 1)
      expect(diary_entry1.reading_chunk(10,1)).to eq "This is an extremely short story to see if a"
    end

  it "returns the first chunk of string if text ends exactly on last word" do
    diary_entry1 = DiaryEntry.new("A Very Short Story", 
      "This is an extremely short story to see if a certain method works. That method involves splitting up a text into readable chunks. Let's see if that works!")
      diary_entry1.reading_chunk(10, 1)
      diary_entry1.reading_chunk(10, 1)
      diary_entry1.reading_chunk(8,1)
      expect(diary_entry1.reading_chunk(10,1)).to eq "This is an extremely short story to see if a"
    end  
end