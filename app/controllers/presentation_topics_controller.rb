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
    @presentation_topic = @user.presentation_topics.find(params[:id])
  end

  def destroy
  end

  def topics_index
    @user = User.find(params[:user_id])
    @presentation_topics = @user.presentation_topics.all
  end

  def vote
    @user = User.find(params[:user_id])
    @presentation_topic = @user.presentation_topics.find(params[:presentation_topic_id])

    if @user.votes_remaining > 0
      @presentation_topic.votes += 1
      if @presentation_topic.update_attributes(params[:presentation_topic])
        @user.votes_remaining -= 1
        @user.update_attributes(params[:user])
        redirect_to user_presentation_topic_path(@user,@presentation_topic), :notice => "You have voted for this topic ! "
      end
    else
      redirect_to user_presentation_topic_path(@user,@presentation_topic), :alert => " You've No Votes Remaining !! "
    end
  end

end
