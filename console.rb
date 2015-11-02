require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/user'


binding.pry