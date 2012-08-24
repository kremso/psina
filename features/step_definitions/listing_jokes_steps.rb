Given /^the joke "(.*?)" is published$/ do |joke|
  joke = Joke.new
  joke.body = joke
  joke.published = true
  joke.save!
end

When /^I go to the jokes listing$/ do
  visit jokes_path
end

Then /^I should see a joke "(.*?)"$/ do |joke|
  joke.should have_content(joke)
end
