class FeedController < ApplicationController
  def index
    @list_today = Array.new
    @list_tomorrow = Array.new
    @list_other = Array.new
    tasks = Task.where(performer_id: 1, active: true).order('deadline DESC')
    tasks.each do |item|
      if item.deadline == Date.today
        @list_today << item
      elsif item.deadline == Date.tomorrow
        @list_tomorrow << item
      else
        @list_other << item
      end
    end
  end
end
