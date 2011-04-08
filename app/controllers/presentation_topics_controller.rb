class PresentationTopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @presentation_topics =  PresentationTopic.latest_topics
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

  def edit
    @user = User.find(params[:user_id])
    @presentation_topic = @user.presentation_topics.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @presentation_topic = @user.presentation_topics.find(params[:id])
    if @presentation_topic.update_attributes(params[:presentation_topic])
        redirect_to(user_presentation_topic_path(@user,@presentation_topic), :notice => 'Your Post was updated successfully.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @presentation_topic = @user.presentation_topics.find(params[:id])
    if @presentation_topic.destroy
      redirect_to user_topics_index_path(@user), :notice => "Topic Deleted !"
    else
      redirect_to user_presentation_topic_path(@user,@presentation_topic), :alert => "Unable to Delete! Please Try Again."
    end
  end

  def topics_index
    @user = User.find(params[:user_id])
    @presentation_topics = @user.presentation_topics.all
  end

  def vote
    @user = User.find(params[:user_id])
    @presentation_topic = @user.presentation_topics.find(params[:presentation_topic_id])

    respond_to do |format|
    # , :only => :vote
       # def vote
       #         respond_with(@user,@presentation_topic)
       #        end
       format.html { redirect_to user_presentation_topic_path(@user,@presentation_topic), :alert => " You've NO VOTES Remaining !! " }
              format.js
    end

    # if current_user.id == @presentation_topic.user_id
    #       redirect_to user_presentation_topic_path(@user,@presentation_topic), :alert => " You CANNOT VOTE for your own Topic !! "
    #     else
    #       if current_user.votes_remaining > 0
    #           @presentation_topic.votes += 1
    #           @presentation_topic.update_attributes(params[:presentation_topic])
    #           current_user.votes_remaining -= 1
    #           current_user.update_attributes(params[:user])
    #           redirect_to user_presentation_topic_path(@user,@presentation_topic), :notice => "You've VOTED for this Topic ! "
    #       else
    #         redirect_to user_presentation_topic_path(@user,@presentation_topic), :alert => " You've NO VOTES Remaining !! "
    #       end
    #     end
  end


end
