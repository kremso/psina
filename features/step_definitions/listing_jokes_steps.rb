Given /^the joke "(.*?)" is published$/ do |joke|
  joke = Joke.new
  joke.body = joke
  joke.title = "Joke"
  joke.advice = "Advice"
  joke.author = "Ferko Mak"
  joke.email = "ferko@mak.sk"
  joke.published = true
  joke.save!
end

When /^I go to the jokes listing$/ do
  visit jokes_path
end

Then /^I should see a joke "(.*?)"$/ do |joke|
  joke.should have_content(joke)
end
