class PresentationTopicsController < ApplicationController

 before_filter :authenticate_user!

  def index
    @presentation_topics =  PresentationTopic.all
  end

  def new
    @user = User.find(params[:user_id])
    @presentation_topic =  @user.presentation_topics.new
  end

  def create
    @user = User.find(params[:user_id])
    @presentation_topic =  @user.presentation_topics.create(params[:presentation_topic])
    if @presentation_topic.save
      redirect_to users_path, :notice => "You have posted a Presentation Topic successfully ! "
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def destroy
  end

  def topics_index
    @user = User.find(params[:user_id])
    @presentation_topics = @user.presentation_topics.all
  end

end
