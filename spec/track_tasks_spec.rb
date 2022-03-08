require "track_tasks"

RSpec.describe "track tasks" do
  it "returns error message if string is empty " do
    expect{ track_tasks("") }.to raise_error "Please enter task."
  end

  it "returns true if string contains '@TODO' at the start" do
    result = track_tasks("@TODO make sandwich")
    expect(result).to eq true
  end

  it "returns true if string contains '@TODO' at the end" do
    result = track_tasks("Go to the gym @TODO")
    expect(result).to eq true
  end
  
  it "returns false if string does not contain '@TODO'" do
    result = track_tasks("Make a cup of tea")
    expect(result).to eq false
  end

  it "returns false if string containts '@todo'" do
    result = track_tasks("@todo go shopping")
    expect(result).to eq false
  end
end    