# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[
  {:email => "manish@sprout.com", :password => "secret", :username => "Manish"},
  {:email => "prasvin@sprout.com", :password => "secret", :username => "Prasvin"},
  {:email => "dipesh@sprout.com", :password => "secret", :username => "Dipesh"},
  ].each do |attrs|
    User.find_or_create_by_username(attrs)
  end

  [
    {:user_id => 13, :title => "HAML", :description => "Haml (HTML Abstraction Markup Language)", :duration => 50},
    {:user_id => 14, :title => "SASS", :description => " Sass is a Cascading Style Sheets (CSS) metalanguage", :duration => 30},
    {:user_id => 15, :title => "MongoDb", :description => "MongoDB is an open source, document-oriented database", :duration => 60},
    ].each do |attrs|
      PresentationTopic.find_or_create_by_title(attrs)
    end