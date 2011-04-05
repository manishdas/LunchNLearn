class PresentationTopicsController < ApplicationController

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

  def delete
  end


end
