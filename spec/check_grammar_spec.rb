require "check_grammar"

RSpec.describe "check grammar" do
  it "returns true if string begins with capital letter and ends with full stop" do
    result = check_grammar("I'm checking if this is grammatically correct.")
    expect(result).to eq true
  end
  
  it "returns true if string begins with capital letter and ends with question mark" do
    result = check_grammar("I'm checking if this is grammatically correct?")
    expect(result).to eq true
  end

  it "returns true if string begins with capital letter and ends with exclamation mark" do
    result = check_grammar("I'm checking if this is grammatically correct!")
    expect(result).to eq true
  end
  
  it "returns false if string begins without capital letter and ends with full stop" do
    result = check_grammar("i'm checking if this is grammatically correct.")
    expect(result).to eq false
  end

  it "returns false if string begins with capital letter and doesn't end with full stop" do
    result = check_grammar("i'm checking if this is grammatically correct")
    expect(result).to eq false
  end

  it "fails" do
    expect { check_grammar("") }.to raise_error "No input."
  end  
end
