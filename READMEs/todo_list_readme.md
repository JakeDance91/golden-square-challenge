# Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## Design the Class Interface
Include the initializer and public methods with all parameters and return values.

``` ruby
class ToDo
  def initializer
    # array for todos? 
  end

  def add_todo(text) # test is a string representing a todo entry
  # if empty returns error
  # pushes to todo array
  end

  def list
  # Returns a list of strings from todo list
  end

  def todo_complete(text)
  # Removes matching string from array 
  # fails if no matching string
  end

end  
```
3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# EXAMPLE

``` ruby
# 1
todo_list = ToDo
todo_list.add_todo("Walk the dog")
todo_list.list() # => "Walk the dog, Kay!"

# 2
todo_list = ToDo
todo_list.add_todo("")
reminder.remind() # fails with "No task given."

# 3
todo_list = ToDo
todo_list.add_todo("Walk the dog")
todo_list.add_todo("Walk the other dog")
todo_list.list() # => "Walk the dog, Kay!"/n "Walk the other dog"

``` 

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

