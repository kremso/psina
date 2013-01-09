# encoding: utf-8

Given /^I go to the new joke submission page$/ do
  visit new_joke_path
end

When /^I fill in a new joke "(.*?)"$/ do |joke|
  fill_in "joke_body", with: joke
  fill_in "joke_title", with: "Joke"
  fill_in "joke_advice", with: "Advice"
  fill_in "joke_author", with: "Ferko Mak"
  fill_in "joke_email", with: "ferko@mak.sk"
end

When /^I submit the joke$/ do
  click_button "Odoslať vtip"
end

Then /^the joke should be queued for review by administrator$/ do
  Joke.first.should_not be_published
end

When /^I assign it tags "(.*?)"$/ do |tags|
  fill_in "joke_tags", with: tags
end

Then /^the joke should be tagged with "(.*?)"$/ do |tag|
  Joke.first.tags.to_s.should include(tag)
end
