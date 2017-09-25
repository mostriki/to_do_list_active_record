class Task
  attr_reader(:description, :due_date, :list_id)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @due_date = attributes.fetch(:due_date)
    @list_id = attributes.fetch(:list_id)
  end

  def self.all
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      due_date = task.fetch("due_date")
      list_id = task.fetch("list_id").to_i()
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}', #{@list_id});")
  end

  def ==(another_task)
    self.description().==(another_task.description()).&(self.due_date().==(another_task.due_date())).&(self.list_id().==(another_task.list_id()))
  end

end
