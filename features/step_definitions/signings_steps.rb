Given /^the following signings:$/ do |signings|
  Signings.create!(signings.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) signings$/ do |pos|
  visit signings_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following signings:$/ do |expected_signings_table|
  expected_signings_table.diff!(tableish('table tr', 'td,th'))
end
