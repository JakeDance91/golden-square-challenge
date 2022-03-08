require "make_snippet"

RSpec.describe "make_snippet" do
  it "returns a string as 5 words + '...'" do
    result = make_snippet("Today I learned about test driven development")
    expect(result).to eq "Today I learned about test..."
  end
  it "returns a string as 3 words" do
    result = make_snippet("I love TDD")
    expect(result).to eq "I love TDD"
  end

  it "returns an empty string as an empty string" do
    result = make_snippet("")
    expect(result).to eq ""
  end
end