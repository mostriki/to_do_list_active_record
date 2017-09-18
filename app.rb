require ("sinatra")
require ("pry")
require ("sinatra/reloader")
also_reload(".lib/**/*.rb")
require ("./lib/task")
require("./lib/list")
require ("pg")

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @tasks = Task.all()
  @list = List.all()

  erb(:input)
end

post('/') do
  @tasks = Task.all()
  @list = List.all()

  list = params['name']
  task = params['description']

  new_task = Task.new({:description => tasl, :list_id => @list_id})
  new_list = List.new({:name => list, :id => @id})

  new_list.save()
  new_task.save()

  erb(:input)
end
