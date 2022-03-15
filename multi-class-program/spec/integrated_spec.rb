require "Diary"
require "DiaryEntry"
require "TodoList"
require "Todo"

RSpec.describe "Diary" do
  context "when we add a diary entry" do
    it "returns diary entry in an array" do
      diary = Diary.new
      new_entry = DiaryEntry.new("Day 1", "This is my first day")
      diary.add(new_entry)
      result = diary.read
      expect(result).to eq [new_entry]
    end
  end
  context "when we add multiple diary entries" do
    it "returns multiple diary entries in array" do
      diary = Diary.new
      new_entry1 = DiaryEntry.new("Day 1", "This is my first day")
      new_entry2 = DiaryEntry.new("Day 2", "This is my second day and ooh boy is it so much longer!")
      diary.add(new_entry1)
      diary.add(new_entry2)
      result = diary.read
      expect(result).to eq [new_entry1, new_entry2]
    end
    it "returns suitable diary entry to read when running read_within_time(1, 6)" do
      diary = Diary.new
      new_entry1 = DiaryEntry.new("Day 1", "This is my first day")
      new_entry2 = DiaryEntry.new("Day 2", "This is my second day and ooh boy is it so much longer!")
      diary.add(new_entry1)
      diary.add(new_entry2)
      result = diary.read_within_time(1, 6)
      expect(result).to eq new_entry1
    end
    it "returns suitable diary entry to read when running read_within_time(6, 1)" do
      diary = Diary.new
      new_entry1 = DiaryEntry.new("Day 1", "This is my first day")
      new_entry2 = DiaryEntry.new("Day 2", "This is my second day and ooh boy is it so much longer!")
      new_entry3 = DiaryEntry.new("Day 3", "This is my third day - I'm doing good")
      new_entry4 = DiaryEntry.new("Day 4", "This is my fourth day, Yay!")
      diary.add(new_entry1)
      diary.add(new_entry2)
      diary.add(new_entry3)
      diary.add(new_entry4)
      result = diary.read_within_time(1, 6)
      expect(result).to eq new_entry4
    end
    it "returns a list of contact numbers extracted from diary entries when calling contact_list" do
      diary = Diary.new
      new_entry1 = DiaryEntry.new("Day 1", "This is my first day, I got person's number - it is 07777777777")
      new_entry2 = DiaryEntry.new("Day 2", "person two's number is 07878787878. This is my second day and ooh boy is it so much longer!")
      new_entry3 = DiaryEntry.new("Day 3", "This is my third day - I'm doing good")
      new_entry4 = DiaryEntry.new("Day 4", "This is my fourth day, Yay! I got to add 07879787978")
      diary.add(new_entry1)
      diary.add(new_entry2)
      diary.add(new_entry3)
      diary.add(new_entry4)
      result = diary.contact_list
      expect(result).to eq ["07777777777", "07878787878", "07879787978"]
    end
  end
end

RSpec.describe "ToDoList" do
  context "When we add a task" do
    it "returns list with task" do
      todo_list = TodoList.new
      new_task = Todo.new("Walk the dog")
      todo_list.add(new_task) 
      result = todo_list.list
      expect(result).to eq [new_task]
    end
  end
  context "When we add multiple tasks" do
    it "returns list with multiple tasks" do
      todo_list = TodoList.new
      new_task = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      todo_list.add(new_task)
      todo_list.add(new_task2)
      result = todo_list.list
      expect(result).to eq [new_task, new_task2]
    end
    it "returns a completed list of tasks marked 'complete'" do
      todo_list = TodoList.new
      new_task = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      todo_list.add(new_task)
      todo_list.add(new_task2)
      new_task.mark_done
      result = todo_list.complete
      expect(result).to eq [new_task]
    end
    it "returns a list of todos minus tasks marked 'complete'" do
      todo_list = TodoList.new
      new_task = Todo.new("Walk the dog")
      new_task2 = Todo.new("Wash the car")
      new_task3 = Todo.new("Do the washing up")
      todo_list.add(new_task)
      todo_list.add(new_task2)
      todo_list.add(new_task3)
      new_task.mark_done
      result = todo_list.list
      expect(result).to eq [new_task2, new_task3]
    end
  end
end

