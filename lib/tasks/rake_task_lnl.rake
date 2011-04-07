namespace :user do
  desc "Reset votes_remaining of User (to default 5)"
  task :reset_votes => :environment do
    @users = User.all
    puts " USER's E-MAIL \t\t VOTES_REMAINING"
    @users.each do |user|
      user.votes_remaining = 5
      user.save
      puts "#{user.email} \t\t #{user.votes_remaining}"
    end
  end

end


namespace :topic do
  desc "Select topic with highest votes for next lNl"
  task :next_lnl => :environment do
    max_vote = PresentationTopic.maximum("votes")
    tp = PresentationTopic.where(:votes => max_vote)
    tp = tp.sort_by {rand}.first
    puts "\nTITLE: #{tp.title}"
    puts "POSTED BY: #{User.find(tp.user_id).email}"
    puts "PRESENTATION DURATION (in minutes): #{tp.duration}"
    puts "TOTAL VOTES: #{tp.votes}"
    puts "\nDESCRIPTION: \n#{tp.description}\n"
  end

end
