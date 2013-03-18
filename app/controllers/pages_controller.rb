class PagesController < ApplicationController

  def index
    if current_user 
      redirect_to overview_path
    end
  end

  def overview
    @stuff = Stuff.all
  end
end
