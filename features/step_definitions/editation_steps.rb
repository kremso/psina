# encoding: utf-8
When /^I go to the joke editation screen$/ do
  page.driver.browser.authorize 'admin', 'psina2012'
  visit admin_jokes_path
end

When /^I edit the joke "(.*?)" and change its title to "(.*?)"$/ do |joke, new_title|
  within(".published-jokes tr:contains('#{joke}')") do
    fill_in "joke_title", with: new_title
    click_button "Upraviť"
  end
end

Then /^the joke "(.*?)" should exist$/ do |joke|
  Joke.where(title: joke).should_not be_nil
end

When /^I unpublish joke "(.*?)"$/ do |joke|
  within(".published-jokes tr:contains('#{joke}')") do
    click_link "Odpublikovať"
  end
end

Then /^the joke "(.*?)" should not be published$/ do |joke|
  Joke.where(title: joke).first.should_not be_published
end
