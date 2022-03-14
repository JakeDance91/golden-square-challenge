require 'Todo'
require 'TodoList'

RSpec.describe "integration" do
  context "when we add a todo task" do
    it "adds that task to the todo list" do
      todo_list = TodoList.new
      new_task = Todo.new("Walk the dog")
      todo_list.add(new_task)
      result = todo_list.incomplete
      expect(result).to eq [new_task]
    end
  end
  
  context "when we complete a todo task" do
    it "adds incomplete todo to complete todo list" do
      todo_list = TodoList.new
      new_task1 = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      todo_list.add(new_task1)
      todo_list.add(new_task2)
      new_task1.mark_done!
      result = todo_list.complete
      expect(result).to eq [new_task1]
    end
    
    it "removes complete todo from original todo list" do
      todo_list = TodoList.new
      new_task1 = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      todo_list.add(new_task1)
      todo_list.add(new_task2)
      new_task1.mark_done!
      todo_list.complete
      result = todo_list.incomplete
      expect(result).to eq [new_task2]
    end
  end

  context "when no completed todo tasks" do
    it "returns an empty list" do
      todo_list = TodoList.new
      new_task1 = Todo.new("Walk the dog")
      todo_list.add(new_task1)
      result = todo_list.complete
      expect(result).to eq []
    end
  end

  context "#give_up!" do
    it "marks all todos as complete" do
      todo_list = TodoList.new
      new_task1 = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      todo_list.add(new_task1)
      todo_list.add(new_task2)
      todo_list.give_up!
      result = todo_list.complete
      expect(result).to eq [new_task1, new_task2]
    end
  end
end