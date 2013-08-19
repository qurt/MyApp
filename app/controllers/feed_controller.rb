class FeedController < ApplicationController
  def index

    tasks = Task.select("id, date(deadline) as deadline, title, project_id, status").where(performer_id: session[:user_id], active: true).order('deadline DESC')
    list_today = tasks.select{|item| item.deadline == Date.today}
    list_tomorrow = tasks.select{|item| item.deadline == Date.tomorrow}
    list_other = tasks.select{|item| item.deadline > Date.tomorrow}
    list_warning = tasks.select{|item| item.deadline < Date.today}

    @list_days = Array.new
    @list_days[0] = list_today
    @list_days[1] = list_tomorrow
    @list_days[2] = list_other
    @list_days[3] = list_warning.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_days }
    end
  end

  def refresh
    check_date = Time.now - 10.second
    tasks = Task.where('created_at >= :date AND performer_id = :id', date: check_date, id: session[:user_id])
    render json: tasks
  end
end
