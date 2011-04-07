class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.all

    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to users_path, :notice => "You have signed up successfully ! "
    else
      render "new"
    end
  end
  #
  # def show
  #   @user = current_user
  # end
  #

end
