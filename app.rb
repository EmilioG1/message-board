require('sinatra')
require('sinatra/reloader')
require('./lib/message')
require('pry')
require('./lib/board')
also_reload('lib/**/*.rb')

get('/') do
  @boards = Board.all
  erb(:boards)
end

get('/boards') do
  @boards = Board.all
  erb(:boards)
end

get('/boards/new') do
  erb(:new_board)
end

get('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  erb(:board)
end


post('/boards') do
  name = params[:board_name]
  board = Board.new(name, nil)
  board.save()
  @boards = Board.all()
  erb(:boards)
end

get('/boards/:id/edit') do 
  @board = Board.find(params[:id].to_i())
  erb(:edit_board)
end

patch('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:name])
  @boards = Board.all
  erb(:boards)
end

delete('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.delete()
  @boards = Board.all
  erb(:boards)
end