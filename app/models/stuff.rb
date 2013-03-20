class Stuff < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  def make_action (current_user)
    action = current_user.actions.build(description: description)
    action.save
    action
  end
end
