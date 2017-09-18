require ("sinatra")
require ("pry")
require ("sinatra/reloader")
also_reload(".lib/**/*.rb")
require ("./lib/task")
require("./lib/list")
require ("pg")

DB = PG.connect({:dbname => "to_do1"})

get('/') do


  erb(:input)
end

post('/') do


  erb(:input)
end
