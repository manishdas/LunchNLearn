class PresentationTopic < ActiveRecord::Base

  belongs_to :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :duration, :presence => true
end
