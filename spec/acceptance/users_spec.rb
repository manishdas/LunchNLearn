require 'acceptance/acceptance_helper'

feature "Articles", %q{
  In order to view all the topics
  As an user
  I want to view a topic
  } do

    background do
      @user = User.make!
    end

    scenario "User index", :js => true do
      visit new_user_session_path
      fill_in("Email", :with => "#{@user.email}")
      fill_in("Password", :with => "#{@user.password}")
      click_button("Sign in")
      visit users_path
      page.should have_content("Welcome #{@user.email}")

      visit new_user_presentation_topic_path(@user)
      fill_in("Title", :with => "New Mac")
      fill_in("Description", :with => "Its on the rise")
      fill_in("Presentation Duration (in minutes)", :with => 33)
      click_button("Create Presentation topic")
      page.should have_content("You have posted a Presentation Topic successfully ! ")

      visit presentation_topics_path
      click_link("New Mac")
      click_link("vote_button")
      page.should have_content(" You CANNOT VOTE for your own Topic !! ")
      User.last.votes_remaining.should == 5
      PresentationTopic.last.votes.should == 0
    end

  end