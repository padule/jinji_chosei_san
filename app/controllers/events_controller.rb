class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]

    params[:date_times].each_line do |date_time|
      @event.schedules.build(date_time: date_time)
    end

    @event.save

    redirect_to action: :admin, id: @event.id, access_token: @event.access_token
  end

  def show
    @event = Event.find_by_access_token params[:access_token]
    @member = Member.new event_id: @event.id
    @event.schedules.each do |schedule|
      @member.member_schedules.build schedule_id: schedule.id
    end
  end

  def admin
    @event = Event.find_by_id_and_access_token params[:id], params[:access_token]
  end

end
