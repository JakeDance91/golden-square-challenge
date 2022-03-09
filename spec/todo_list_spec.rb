require "todo_list"

RSpec.describe "to do list" do
  it "returns one item added to the list" do
    todo_list = ToDo.new
    todo_list.add_todo("Walk the dog")
    result = todo_list.list
    expect(result).to eq ["Walk the dog"]
  end

  it "fails when no input given and returns error message" do
    todo_list = ToDo.new
    expect{ todo_list.add_todo("") }.to raise_error "No task given."
  end
    
  it "fails when no input given and returns error message" do
    todo_list = ToDo.new
    todo_list.add_todo("Walk the dog")
    todo_list.add_todo("Walk the other dog")
    result = todo_list.list 
    expect(result).to eq ["Walk the dog", "Walk the other dog"]
  end

  it "fails when input does not match todo list item" do
    todo_list = ToDo.new
    todo_list.add_todo("Walk the dog")
    todo_list.add_todo("Walk the other dog")
    expect{ todo_list.todo_complete("Wash the car") }.to raise_error "No such task."
  end

  it "removes an item from the list after adding" do
    todo_list = ToDo.new
    todo_list.add_todo("Walk the dog")
    todo_list.add_todo("Walk the other dog")
    todo_list.add_todo("Wash the car")
    todo_list.todo_complete("Walk the other dog")
    result = todo_list.list
    expect(result).to eq ["Walk the dog", "Wash the car"]
  end

end
