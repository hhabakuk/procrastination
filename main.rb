require 'pry'
require 'sinatra'
require 'sinatra/reloader'
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

  redirect to '/do_you_feel'

end


get '/do_you_feel' do # pointless page 

erb :what_to_do

end

get '/go_on_then' do # if user doesnt procrastinate

erb :go_on_then
end

get '/congrats' do 
  erb :congrats
end

get '/q1' do
# if !params[:guess].nil? && !params[:guess].empty?
  # @guess = params[:quess]
  # user = User.find_by(id: session[:user_id])
  # user.answer1 = params[:guess]
  # user.save

 #  if @guess == "2"
 #    @answer = "That's correct. Though it's kind of sad that you know it."
 #  else
 #    @answer = "Nope, just 0,1 calories. No point of hoping for a slim shape here."
 #  end

 # else
 #  @answer = []
  erb :q1
end
# end

post '/q1' do

  user = User.find_by(id: session[:user_id])
  user.answer1 = params[:guess]
  user.save

  redirect to '/a1'
end

get '/a1' do

  erb :a1
end

get '/who_are_you' do
  erb :who_are_you
end

get '/results' do
  erb :results
end




