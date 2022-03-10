require "Diary"
require "DiaryEntry"

RSpec.describe "integration" do
  context "after adding some entries" do
    it "lists out the entries added" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("my title", "my contents")
      diary_entry2 = DiaryEntry.new("my title", "my contents")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.all).to eq [diary_entry1, diary_entry2]
    end  
  end  

  describe "word counting behaviour" do
    it "returns number of words in all diary entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("my title", "my contents")
      diary_entry2 = DiaryEntry.new("my title", "my contents")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.count_words).to eq 4
    end  
  end 

  describe "reading time behaviour" do
    it "calculates the reading time for all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("my title", "my contents")
      diary_entry2 = DiaryEntry.new("my title", "my contents")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq "#{2} minutes"
    end
  end

  describe "best reading time behaviour" do
    context "where we have just one entry and it is readable in the time" do
      it "returns that entry" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("my title", "my contents")
        diary.add(diary_entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry1
      end
    end

    context "where we have just one entry and it is unreadable in the time" do
      it "returns nil" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("my title", "my contents is much much longer")
        diary.add(diary_entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
      it "has a best readable entry of nil" do
        diary = Diary.new
        expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil
      end
    end

    context "where we have multiple entries" do
      it "returns the longest entry the user could read in this time" do
        diary = Diary.new
        best_entry = DiaryEntry.new("my title", "my contents")
        diary.add(DiaryEntry.new("my title", "my"))
        diary.add(best_entry)
        diary.add(DiaryEntry.new("my title", "my contents add"))
        diary.add(DiaryEntry.new("my title", "my contents add two"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end
  end
end