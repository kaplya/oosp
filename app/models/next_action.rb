class NextAction < ActiveRecord::Base
  attr_accessible :area_id, :assigned_to, :description, :project_id, :scheduled_for, :user_id

  belongs_to :project
  belongs_to :action
end
