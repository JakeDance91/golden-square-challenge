class ToDo
  def initialize
    @todos = []
  end

  def add_todo(text)
    fail "No task given." if text.empty?
    @todos << text
  end

  def list
    return @todos
  end

  def todo_complete(text)
    fail "No such task." unless @todos.include? text
    @todos.delete(text)
  end

end  