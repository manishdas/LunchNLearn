require 'spec_helper'

describe PresentationTopic do

  it { should belong_to :user }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :duration }

  it "should have the same details" do
    topic = PresentationTopic.create!(:title => "Champions League Quarter Final", :description => "Chelsea vs Manchester", :duration => 90)

    topic.title.should == "Champions League Quarter Final"
    topic.title.should_not == "World Cup 2011"
    topic.description.should == "Chelsea vs Manchester"
    topic.duration.should == 90
  end

end
