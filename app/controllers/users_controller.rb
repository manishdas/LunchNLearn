class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to users_path, :notice => "You have signed up successfully"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def delete
  end


end
