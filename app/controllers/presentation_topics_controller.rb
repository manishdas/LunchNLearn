class PresentationTopicsController < ApplicationController

 before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
  end

  def destroy
  end


end
