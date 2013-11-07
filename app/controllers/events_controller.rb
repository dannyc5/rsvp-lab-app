class EventsController < ApplicationController
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def new
    @event = Event.new
    @user = User.find(params[:id])
  end

  def create
    if Event.create(event_params)
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(param[:id])

    if @event.update_attributes(event_params)
      redirect_to action: 'index'
    else
      render action: 'edit', id: @event
    end
  end

  def destroy
    event = Event.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private

  def event_params
    params.require(:event).permit(:name, :user_id)
  end

end
