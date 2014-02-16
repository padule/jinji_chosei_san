class MembersController < ApplicationController
  def create
    @event = Event.find_by_access_token params[:event_access_token]

    @member = Member.create params[:member]

    redirect_to action: :show, access_token: @member.access_token
  end

  def show
    @member = Member.find_by_access_token params[:access_token]
  end

  def new
    @event = Event.find_by_access_token params[:event_access_token]
    @member = Member.new event_id: @event.id
    @event.schedules.each do |schedule|
      @member.member_schedules.build schedule_id: schedule.id
    end
  end

end