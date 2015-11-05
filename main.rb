require 'sinatra'
require 'sinatra/reloader'
require 'time_diff'
require 'HTTParty'
require 'json'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/question'
require_relative 'models/disagreement'


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
  $start_time = Time.now
  redirect to '/do_you_feel'

end


get '/do_you_feel' do # pointless page 
  @activity = User.find_by(id: session[:user_id]).activity
  erb :what_to_do

end

get '/go_on_then' do # if user doesn't procrastinate
  @activity = User.find_by(id: session[:user_id]).activity
  erb :go_on_then
end

get '/congrats' do # user is accepted to procrastinate
  erb :congrats
end


get '/trivia' do # random number from api
  if !params[:number].nil? && !params[:number].empty? 
    @trivia = HTTParty.get("http://numbersapi.com/#{params[:number]}")
  else 
    @trivia = ' '
  end
  erb :trivia
end


get '/q1' do # displays the question, gets user answer

  @question = Question.all

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
  @activity = User.find_by(id: session[:user_id]).activity

   if question.answer == guess

    @answer = "happy"

  else 

    @answer = "sad, right answer is #{question.answer}"

  end

  erb :a1

end

get '/write_novel' do
  erb :write_novel
end

post '/write_novel/save' do
  characters = params[:characters]
  user = User.find_by(id: session[:user_id])
  user.characters = characters.length
  user.save
  redirect to '/doctor'
end

get '/doctor' do
 $doctor_start_time = Time.now

  erb :doctor
end

get '/no_worries' do
  erb :no_worries
end

get '/who_are_you' do
  $doctor_end_time = Time.now
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
  end_time = Time.now
  user = User.find_by(id: session[:user_id])
  @guess = user.guess1
  @name = user.name
  @characters = user.characters
  @nth_procrastinator = User.all.length
  @activity = user.activity


  all_users = User.all.length
  users_agreed = User.where(guess1: @guess).length - 1
  @percentage = users_agreed * 100 / all_users
  sessiontime = Time.diff($start_time, end_time, '%m minutes and %s seconds')
  @duration = sessiontime[:diff]
  doctor_sessiontime = Time.diff($doctor_start_time, $doctor_end_time, '%m minutes and %s seconds')
  @doctor_duration = doctor_sessiontime[:diff]
  erb :results
end

get '/argue' do

  :argue
end


