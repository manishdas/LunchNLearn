require 'spec_helper'

describe User do

  it { should have_many :presentation_topics }

  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :email }

  it "should  have few unique details" do
    user = User.make!

    user.username.should_not == "manish"
    user.email.should_not == "manish@gmail.com"
    user.password.should == "secret"
  end

end
