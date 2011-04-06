require 'test_helper'

class PresentationTopicTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: presentation_topics
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  duration    :integer         default(0)
#  votes       :integer         default(0)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

