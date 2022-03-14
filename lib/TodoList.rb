class TodoList
  def initialize
    @todo_list = []
    @complete_list = []
  end

  def add(todo) 
    @todo_list << todo
  end

  def incomplete
    @todo_list
  end

  def complete
    @todo_list.each { |todo| 
      if todo.done?
        @complete_list << todo 
      end 
      }
    @complete_list.each { |todo|
      if todo.done?
        @todo_list.delete(todo)
      end
      }  
    @complete_list
  end

  def give_up!
    @todo_list.map { |task|
      task.mark_done!
    }
  end
end
