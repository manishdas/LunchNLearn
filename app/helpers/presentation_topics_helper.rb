module PresentationTopicsHelper

  def my_helper_function(topic,user)
    if user.id == topic.user_id
      content_tag :h3 do
        [
          " You CANNOT VOTE for your own Topic !! "
          ].join(' ').html_safe
        end

    else
      if user.votes_remaining > 0
        topic.votes += 1
        topic.update_attributes(params[:presentation_topic])
        user.votes_remaining -= 1
        user.update_attributes(params[:user])
        # :notice => "You've VOTED for this Topic ! "
      else
        # :notice => " You've NO VOTES Remaining !! "
      end
    end
  end

end

