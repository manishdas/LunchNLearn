Given /^the following presentation_topics_creations:$/ do |presentation_topics_creations|
  PresentationTopicsCreation.create!(presentation_topics_creations.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) presentation_topics_creation$/ do |pos|
  visit presentation_topics_creations_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following presentation_topics_creations:$/ do |expected_presentation_topics_creations_table|
  expected_presentation_topics_creations_table.diff!(tableish('table tr', 'td,th'))
end
