# encoding: utf-8

Given /^the joke "(.*?)" is submitted$/ do |joke|
  Joke.create! do |j|
    j.body = joke
    j.published = false
    j.title = joke
    j.advice = "Advice"
    j.author = "Author"
    j.email = "email@email.com"
  end
end

When /^I go to the joke publishing screen$/ do
  page.driver.browser.authorize 'admin', 'psina2012'
  visit admin_jokes_path
end

Then /^I should see the joke "(.*?)" in the list of unpublished jokes$/ do |joke|
  within '.unpublished-jokes' do
    page.should have_content(joke)
  end
end

When /^I rate the joke "(.*?)" with (\d+) stars and add a comment "(.*?)" and confirm the publishing$/ do |joke, rating, comment|
  within(".unpublished-jokes tr:contains('#{joke}')") do
    choose "joke_rating_#{rating}"
    fill_in "joke_comment", with: comment
    click_button "Publikovať"
  end
end

Then /^the joke "(.*?)" should be published$/ do |joke|
  Joke.where(title: joke).published.should be_true
end
