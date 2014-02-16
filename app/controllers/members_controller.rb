class MembersController < ApplicationController
  def create
    @event = Event.find_by_access_token params[:event_access_token]

    @member = Member.create params[:member]

    redirect_to action: :show, access_token: @member.access_token
  end

  def show
    @member = Member.find_by_access_token params[:access_token]
  end
end