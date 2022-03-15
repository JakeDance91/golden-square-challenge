class TodoList
  def initialize
  @list = []
  end
  
  def add(todo)
    @list << todo
  end
  
  def list
    @list.reject do |task|
      task.done?
    end
  end
  
  def complete
    @list.select do |task|
      task.done?
    end
  end
end