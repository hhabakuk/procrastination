class Result < ActiveRecord::Base
  belongs_to :users
  has_many :questions
end