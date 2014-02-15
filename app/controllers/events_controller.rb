class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create params[:event]
    redirect_to action: :show, access_token: @event.access_token
  end

  def show
    @event = Event.find_by_access_token params[:access_token]
  end
end
