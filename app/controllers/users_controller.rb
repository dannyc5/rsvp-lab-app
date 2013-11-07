class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def create
    if User.create(user_params)
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(param[:id])

    if @user.update_attributes(user_params)
      redirect_to action: 'index'
    else
      render action: 'edit', id: @user
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
