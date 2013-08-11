class FeedController < ApplicationController
  def index
    list_today = Array.new
    list_tomorrow = Array.new
    list_other = Array.new
    list_warning = Array.new
    tasks = Task.select("id, date(deadline) as deadline, title").where(performer_id: 1, active: true).order('deadline DESC')
    tasks.each do |item|
      if item.deadline == Date.today
        list_today << item
      elsif item.deadline == Date.tomorrow
        list_tomorrow << item
      elsif item.deadline > Date.tomorrow
        list_other << item
      elsif item.deadline < Date.today
        list_warning << item
      end
    end
    @list_days = Array.new
    @list_days[0] = list_today
    @list_days[1] = list_tomorrow
    @list_days[2] = list_other
    @list_days[3] = list_warning
  end
end
