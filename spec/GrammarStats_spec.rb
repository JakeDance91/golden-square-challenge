require "GrammarStats"

RSpec.describe GrammarStats do
  it "returns true if string begins with capital letter and ends with full stop" do
    grammar = GrammarStats.new
    result = grammar.check("I'm checking if this is grammatically correct.")
    expect(result).to eq true
  end
  
  it "returns true if string begins with capital letter and ends with question mark" do
    grammar = GrammarStats.new
    result = grammar.check("I'm checking if this is grammatically correct?")
    expect(result).to eq true
  end

  it "returns true if string begins with capital letter and ends with exclamation mark" do
    grammar = GrammarStats.new
    result = grammar.check("I'm checking if this is grammatically correct!")
    expect(result).to eq true
  end
  
  it "returns false if string begins without capital letter and ends with full stop" do
    grammar = GrammarStats.new
    result = grammar.check("i'm checking if this is grammatically correct.")
    expect(result).to eq false
  end

  it "returns false if string begins with capital letter and doesn't end with full stop" do
    grammar = GrammarStats.new
    result = grammar.check("i'm checking if this is grammatically correct")
    expect(result).to eq false
  end

  it "fails" do
    grammar = GrammarStats.new
    expect { grammar.check("") }.to raise_error "No input."
  end  

  it "returns 75% when 3 checks are true and one is false" do
    grammar = GrammarStats.new
    grammar.check("I'm checking if this is grammatically correct.")
    grammar.check("i'm checking if this is grammatically correct")
    grammar.check("I'm checking if this is grammatically correct?")
    grammar.check("I'm checking if this is grammatically correct!")
    result = grammar.percentage_good
    expect(result).to eq "#{75} + %"
  end

  it "returns 33% when 1 check is true and one is false" do
  grammar = GrammarStats.new
    grammar.check("I'm checking if this is grammatically correct.")
    grammar.check("i'm checking if this is grammatically correct")
    grammar.check("i'm checking if this is grammatically correct.")
    result = grammar.percentage_good
    expect(result).to eq "#{33} + %"
  end
end 