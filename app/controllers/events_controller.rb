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

    redirect_to action: :admin, admin_token: @event.admin_token, access_token: @event.access_token
  end

  def forgote
    if request.post?
      redirect_to params[:event][:url]
    end
  end

  def admin
    @event = Event.find_by_admin_token_and_access_token params[:admin_token], params[:access_token]
  end

end
