require "reading_time"

RSpec.describe "reading time" do
  it "takes a string of 6 words and returns 0.03 minutes" do
    result = reading_time("This is a fairly short sentence")
    expect(result).to eq "#{0.03} minutes"
  end
  
  it "takes a string of 200 words and returns 1 minute" do
    result = reading_time("word " * 200)
      expect(result).to eq "#{1} minute"
  end  

  it "takes a string of 0 words and outputs 'No text has been entered.'" do
    result = reading_time("")
    expect(result).to eq "No text has been entered."
  end

  it "takes the word count from 'The Hobbit' and returns 476.78" do
    result = reading_time("word " * 95356)
    expect(result).to eq "#{476.78} minutes"
  end    
end