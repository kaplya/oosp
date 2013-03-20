class Action < ActiveRecord::Base
  attr_accessible :area_id, :assigned_to, :description, :project_id, :scheduled_for, :user_id
end
