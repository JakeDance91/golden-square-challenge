require "todo_list"

RSpec.describe "to do list" do
  it "returns one item added to the list" do
    todo_list = ToDo
    todo_list.add_todo("Walk the dog")
    result = todo_list.list
    expect(result).to eq "Walk the dog"
  end

  it "fails when no input given and returns error message" do
    todo_list = ToDo
    expect{ todo_list.add_todo("") }.to raise_error "No task given."
  end
    
  it "fails when no input given and returns error message" do
    todo_list = ToDo
    todo_list.add_todo("Walk the dog")
    todo_list.add_todo("Walk the other dog")
    result = todo_list.list 
    expect(result).to eq "Walk the dog, Kay!"\n "Walk the other dog"
  end
end
