class Stuff < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  belongs_to :user

  def make_action (current_user)
    action = current_user.next_actions.build(description: description)
    action.save
    action
  end

  def make_project (current_user)
    project = current_user.projects.build(name: description)
    project.save
    project
  end
end
