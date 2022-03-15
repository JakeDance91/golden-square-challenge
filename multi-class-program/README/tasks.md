# 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

```ruby

class Diary
def initialize
# @list = []
# @contact_no = []
end

def add(diary_entry)
# adds new instance of DiaryEntry to @list array
end

def read
# returns list of diary entries as string + new line
end

def read_within_time(w, wpm)
# returns most suitable diary entry to read within time limit in minutes
# and a words per minute reading speed
end

def readable_entries(w, wpm)
# searches through the array and removes any that exceed parameters
end

def time_taken
# time_taken = (count_words / wpm.to_f).ceil 
end

def contact_list
# searches all diary entries for mobile number within the string and pushes to @contact_no
# returns @contact_no
end

class DiaryEntry(title, contents)
def initialize
# @title = title
# @contents = contents
end

def title
# returns title
end

def contents 
# returns contents
end

def count_words
# counts words within a string and returns it
end

def reading_time(wpm)
# returns reading time oc contents in minutes as an intiger
end

class TodoList
def initialize
@list = list
end

def add(todo)
# adds new instance of Todo to @list array
end

def list
# returns @list array
end

def complete
# returns list of Todo.complete (complete todo's)
end

class Todo
def initialize(task)
@task = task
end

def task
# return task
end

def mark_done
# marks a task as done by adding a specific string
end

```


3. Create Examples as Integration Tests

``` ruby

require "TodoList"
require "Todo"

# 1

"when we add a task, return list with task"

todo_list = TodoList.new
new_task = Todo.new("Walk the dog")
todo_list.add(new_task)
todo_list.list # => [new_task]

# 2

"when we complete a task, it adds the task to the complete list"
 
todo_list = TodoList.new
new_task1 = Todo.new("Walk the dog")
new_task2 = Todo.new("Wash the car")
todo_list.add(new_task1)
todo_list.add(new_task2)
new_task1.mark_done
todo_list.complete # => [new_task1]
     
# 3

"when we complete a task it removes complete todo from original todo list" do
      
todo_list = TodoList.new
new_task1 = Todo.new("Walk the dog")
new_task2 = Todo.new("Wash the car")
todo_list.add(new_task1)
todo_list.add(new_task2)
new_task1.mark_done!
todo_list.complete
todo_list.list # => [new_task2]


require "Diary"
require "DiaryEntry"

#1

"when we add a diary entry, it returns this in a list"

diary = Diary.new
new_entry = DiaryEntry.new("Day 1", "This is my first day")
diary.add(new_entry)
diary.read # => [new_entry]

#2

"when we add two entries and run read_within_time, it returns the most suitable option"

diary = Diary.new
new_entry1 = DiaryEntry.new("Day 1", "This is my first day")
new_entry2 = DiaryEntry.new("Day 2", "This is my second day and ooh boy is it so much longer!")
diary.add(new_entry1)
diary.add(new_entry2)
diary.read_within_time(1, 6) # => new_entry1

"when we call contact_list, it returns list of contact numbers from diary entries"

diary = Diary.new
new_entry1 = DiaryEntry.new("Day 1", "I called my friend today on 07777777777")
new_entry2 = DiaryEntry.new("Day 2", "I called my other friend today on 07878787878")
diary.add(new_entry1)
diary.add(new_entry2)
diary.contact_list # => ["07777777777", "07878787878"]

```
4. Create Examples as Unit Tests

```ruby

"when we define a diary entry, we can use count_words to count words in that string"

new_entry = DiaryEntry.new("Day 1", "This is my first day")
new_entry.count_words # => 5 (words as integer)

"when we define a diary entry, we can use reading_time to calculate the time it would take to read"

new_entry = DiaryEntry.new("Day 1", "This is my first day")
new_entry.reading_time(5) # => 1 (minutes as integer)



```


5. Implement the Behaviour
For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.