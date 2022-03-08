require "count_words"

RSpec.describe "count_words" do
  it "returns number of words in a string as 5" do
    result = count_words("This is 5 words long")
    expect(result).to eq 5
  end

  it "returns empty string as 0" do
    result = count_words("")
    expect(result).to eq 0
  end
end    

