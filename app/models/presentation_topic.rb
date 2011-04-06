class PresentationTopic < ActiveRecord::Base

  belongs_to :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :duration, :presence => true, :numericality => true
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

