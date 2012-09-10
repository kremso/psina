#encoding: utf-8

When /^I search for "(.*?)"$/ do |query|
  fill_in "q", with: query
  click_button "Hľadať"
end

Given /^it is tagged with "(.*?)"$/ do |tags|
  @joke.tags = tags
  @joke.save!
end

