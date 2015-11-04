require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/question'


enable :sessions 

after do 
  ActiveRecord::Base.connection.close
end


get '/' do # first page, gets user activity
  erb :index
end


post '/save_activity' do #saves activity, creates session

  @activity = params[:activity]
  user = User.new(activity: params[:activity])
  user.save
  @user_id = User.last.id
  session[:user_id] = @user_id

  redirect to '/do_you_feel'

end


get '/do_you_feel' do # pointless page 
@activity = User.find_by(id: session[:user_id]).activity
erb :what_to_do

end

get '/go_on_then' do # if user doesn't procrastinate

erb :go_on_then
end

get '/congrats' do # user is accepted to procrastinate
  erb :congrats
end

get '/q1' do # displays the question, gets user answer

@question = Question.first.question

  erb :q1
end


post '/q1/question' do # saves user answer

  guess = params[:guess]
  user = User.find_by(id: session[:user_id])
  question = Question.find_by(id: 1)
  user.guess1 = guess
  user.question_id = question.id
  user.save

  redirect to '/q1/question'

end

get '/q1/question' do

  user = User.find_by(id: session[:user_id])
  question = Question.first
  guess = user.guess1

   if question.answer == guess

    @answer = "happy"

  else 

    @answer = "sad, right answer is #{question.answer}"

  end

  erb :a1

end

get '/who_are_you' do
  erb :who_are_you
end

post '/save_name' do #saves activity, creates session

  name = params[:name]
  user = User.find_by(id: session[:user_id])
  user.name = name
  user.save

  redirect to '/results'

end

get '/results' do
  all_users = User.all.length
  right_users = User.where(guess1: 'blue').length
  @percentage = right_users * 100 / all_users
  erb :results
end




