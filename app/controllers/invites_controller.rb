class InvitesController < ApplicationController
  def index
    @invites = Invite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invites }
    end
  end

  def new
    @invite = Invite.new
    @event = Event.find(params[:id])
  end

  def create
    if Invite.create(invite_params)
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def show
    @invite = Invite.find(params[:id])
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(param[:id])

    if @invite.update_attributes(invite_params)
      redirect_to action: 'index'
    else
      render action: 'edit', id: @invite
    end
  end

  def destroy
    invite = Invite.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private

  def invite_params
    params.require(:invite).permit(:name, :message, :event_id)
  end

end
