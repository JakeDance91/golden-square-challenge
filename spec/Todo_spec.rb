require 'Todo'

RSpec.describe Todo do
  it "constructs" do
    new_todo = Todo.new("Walk the dog")
    expect(new_todo.task).to eq "Walk the dog"
  end
  
  context "when initialised with an empty string" do
    it "fails" do
      new_todo = Todo.new("")
      expect {new_todo.task}.to raise_error "Valid task required"
    end
  end

  context "mark_done!" do
    it "adds @TODO string to original string to mark task as done and checks" do
      new_todo = Todo.new("Walk the dog")
      new_todo.mark_done!
      expect(new_todo.done?).to eq true
    end

    it "skips any already marked as complete tasks" do
      new_todo = Todo.new("Walk the dog")
      new_todo.mark_done! 
      expect{ new_todo.mark_done!}.to raise_error "Already marked as done"
    end
  end
  
  context "done?" do
    it "returns false for incomplete tasks" do
      new_todo = Todo.new("Walk the dog")
      expect(new_todo.done?).to eq false
    end
  end
end