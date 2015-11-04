require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'procrastinators'
}

ActiveRecord::Base.establish_connection(options)