Then /^(\d+) presentation_topic should exist$/ do |number|
  PresentationTopic.count.should == 1
end
