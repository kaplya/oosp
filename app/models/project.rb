class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  has_many :next_actions
end
