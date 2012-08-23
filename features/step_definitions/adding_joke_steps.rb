Given /^I go to the new joke submission page$/ do
  visit new_joke_path
end

When /^I fill in a new joke "(.*?)"$/ do |joke|
  fill_in "body", with: joke
end

When /^I submit the joke$/ do
  click_button "Save changes"
end

Then /^the joke should be queued for review by administrator$/ do
  Joke.first.should_not be_published
end

When /^I assign it tags "(.*?)"$/ do |tags|
  fill_in "tags", with: tags
end

Then /^the joke should be tagged with "(.*?)"$/ do |tag|
  Joke.first.tags.collect(&:label).should include(tag)
end
