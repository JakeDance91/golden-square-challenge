require "Todo"

RSpec.describe "Todo" do 
  it "Returns task as string" do
    task = Todo.new("Walk the dog")
    result = task.task
    expect(result).to eq "Walk the dog"
  end
  it "returns 'true' if task is marked as done" do
    task = Todo.new("Walk the dog")
    task.mark_done
    result = task.done?
    expect(result).to eq true
  end
  it "returns 'false' if task is not marked as done" do
    task = Todo.new("Walk the dog")
    result = task.done?
    expect(result).to eq false
  end
end
