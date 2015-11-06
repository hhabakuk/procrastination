require 'sinatra'
require 'time_diff'
require 'httparty'
require 'json'
require 'pg'


require_relative 'db_config'
require_relative 'models/user'




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


get '/question1' do # displays the question, gets user answer
  erb :question1
end

get '/question1_no' do
  @text = "Yeah, I haven't either"
  user = User.find_by(id: session[:user_id])
  user.answer1 = "no"
  user.save
  erb :answer1question2
end

get '/question1_yes' do
  @text = "Yeah, me too"
  user = User.find_by(id: session[:user_id])
  user.answer1 = "yes"
  user.save
  erb :answer1question2
end

get '/question2' do # displays the question, gets user answer
  erb :question2
end

get '/question2_no' do
  @text = "OMG, I haven't either."
  user = User.find_by(id: session[:user_id])
  user.answer2 = "no"
  user.save
  erb :answer2question3
end

get '/question2_yes' do
  @text = "OMG, me too."
  user = User.find_by(id: session[:user_id])
  user.answer2 = "yes"
  user.save
  erb :answer2question3
end

get '/question3' do # displays the question, gets user answer
  erb :question3
end

get '/question3_no' do
  @text = "Me neither. I'd like to, though."
  user = User.find_by(id: session[:user_id])
  @activity = user.activity
  user.answer3 = "no"
  user.save
  erb :answer3
end

get '/question3_yes' do
  @text = "Me too, the ice cream there is amazing, isn't it?"
  user = User.find_by(id: session[:user_id])
  @activity = user.activity
  user.answer3 = "yes"
  user.save
  erb :answer3
end

post '/write_novel/save' do
  characters = params[:characters]
  user = User.find_by(id: session[:user_id])
  user.characters = characters.length
  user.save
  redirect to '/go_to_doctor'
end

get '/go_to_doctor' do
  erb :go_to_doctor
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
  @activity = user.activity
  @name = user.name
  @characters = user.characters
  @nth_procrastinator = User.all.length
  sessiontime = Time.diff($start_time, end_time, '%m minutes and %s seconds')
  @duration = sessiontime[:diff]
  doctor_sessiontime = Time.diff($doctor_start_time, $doctor_end_time, '%m minutes and %s seconds')
  @doctor_duration = doctor_sessiontime[:diff]

  if user.answer1 == "yes"
    @a1 = "broken a bone"
  else 
    @a1 = "never broken a bone"
  end

  if user.answer2 == "yes"
    @a2 = "seen the rain"
  else 
    @a2 = "never seen the rain"
  end

  if user.answer3 == "yes"
    @a3 = "been to Italy"
  else 
    @a3 = "never been to Italy"
  end

      
  erb :results
end



