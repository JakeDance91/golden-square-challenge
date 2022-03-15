class Todo
  def initialize(task)
  @task = task
  @done_tasks = false
  end
  
  def task
    @task
  end
  
  def mark_done
    @done_tasks = true
  end

  def done?
    return @done_tasks
  end
end  