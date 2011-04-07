
namespace :user do
  desc "Reset votes_remaining of User (to default 5)"
  task :reset_votes => :environment do
    @users = User.all
    puts " USER's E-MAIL \t\t VOTES_REMAINING_BEFORE \t VOTES_REMAINING_AFTER"
    @users.each do |user|
      print "#{user.email} \t\t #{user.votes_remaining}\t\t"
      user.votes_remaining = 5
      user.save
      puts "\t\t #{user.votes_remaining}"
    end
  end
end


namespace :topic do
  desc "Select topic with highest votes for next lNl AND reset votes of each topic to 0"
  task :next_lnl => :environment do
    max_vote = PresentationTopic.maximum("votes")
    topic = PresentationTopic.where(:votes => max_vote)
    topic = topic.sort_by {rand}.first
    puts "\nTITLE: #{topic.title}"
    puts "POSTED BY: #{User.find(topic.user_id).email}"
    puts "PRESENTATION DURATION (in minutes): #{topic.duration}"
    puts "TOTAL VOTES: #{topic.votes}"
    puts "\nDESCRIPTION: \n#{topic.description}\n"

    PresentationTopic.all.each do |topic|
      topic.votes = 0
      topic.save
    end
    puts "\n\nNOTE: Votes of each topic has been RESET to 0 ! \n"
  end
end
