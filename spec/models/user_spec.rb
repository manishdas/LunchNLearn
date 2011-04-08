require 'spec_helper'

describe User do

  it { should have_many :presentation_topics }

  it { should validate_presence_of :email }

  it "should  have few unique details" do
    user = User.make!

    user.username.should_not == "manish"
    user.email.should_not == "manish@gmail.com"
    user.password.should == "secret"
  end

end

# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  username             :string(255)
#  votes_remaining      :integer         default(5)
#  created_at           :datetime
#  updated_at           :datetime
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#

