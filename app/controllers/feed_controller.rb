class FeedController < ApplicationController
  def index

    tasks = Task.select("id, date(deadline) as deadline, title, project_id").where(performer_id: 1, active: true).order('deadline DESC')
    list_today = tasks.select{|item| item.deadline == Date.today}
    list_tomorrow = tasks.select{|item| item.deadline == Date.tomorrow}
    list_other = tasks.select{|item| item.deadline > Date.tomorrow}
    list_warning = tasks.select{|item| item.deadline < Date.today}

    @list_days = Array.new
    @list_days[0] = list_today
    @list_days[1] = list_tomorrow
    @list_days[2] = list_other
    @list_days[3] = list_warning

  end
end
