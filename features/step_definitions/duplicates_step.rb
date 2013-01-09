# encoding: utf-8

Then /^I should see that there is a similar joke "(.*?)"$/ do |joke|
  within '.duplicates' do
    page.should have_content(joke)
  end
end

When /^I force submit the joke again$/ do
  click_button 'Môj vtip je iný. Hoď ho tam.'
end

Then /^the joke "(.*?)" should be queued for review by administrator$/ do |joke|
  # TODO: generated textarea contains \n by default, wtf
  Joke.where(body: "\n#{joke}").first.should_not be_published
end
