class MembersController < ApplicationController
  def create
    @event = Event.find_by_access_token params[:event_access_token]

    @member = Member.create params[:member]

    redirect_to action: :show, id: @member.id
  end

  def show
    @member = Member.find params[:id]
  end
end