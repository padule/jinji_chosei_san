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

  def validate
    if request.post?
      urlArray = params[:event][:url].split("/")
      @event = Event.find_by_access_token urlArray[4]
      if @event && @event.authenticate(params[:event][:password])
        redirect_to action: :admin, admin_token: @event.admin_token, access_token: @event.access_token
      else
        flash.now.alert = "候補者用URLもしくはパスワードが不正です。"
      end
    end
  end

  def admin
    @event = Event.find_by_admin_token_and_access_token params[:admin_token], params[:access_token]
  end

end
