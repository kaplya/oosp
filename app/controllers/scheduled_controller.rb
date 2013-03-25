class ScheduledController < ApplicationController
  def index
    @calendar = (Date.current.beginning_of_month.beginning_of_week..Date.current.end_of_month.end_of_week).each_slice(7).to_a
    @this_month = (Date.current.beginning_of_month..Date.current.end_of_month).to_a
    @today = Date.today
  end
end
