module UsersHelper
#
#   def show_speakers_only(user)
#     if(user.presentation_topics.size > 0)
#       content_tag :h3 do
#         [ "bamti karayo",
#           link_to(user.email, user_topics_index_path(user)),
#           user.presentation_topics.each do |topic| link_to(topic.title, user_presentation_topic_path(user,topic)) end,
#           link_to("See All", user_topics_index_path(user))
#         ].join(' ').html_safe
#       end
#     end
#   end
#
end
