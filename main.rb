require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'

after do 
  ActiveRecord::Base.connection.close
end






