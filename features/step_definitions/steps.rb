
Given(/^I am on the user creation page$/) do
  visit(new_user_path)
end

When(/^I fill in a name$/) do
  fill_in 'Name', :with => "Jane Doe"
end

When(/^I fill in a username$/) do
  fill_in 'Username', :with => "JDoe"
end

When(/^I fill in an email$/) do
  fill_in 'Email', :with => "jane.doe@gmail.com"
end

When(/^I click to create a new user$/) do
  click_button 'Create User'
end

Then(/^I should see the new user's page$/) do
  page.has_content?("User was successfully created")
end

Then(/^I should see the correct name/) do
  page.has_content?("Jane Doe")
end

Then(/^I should see the correct username/) do
  page.has_content?('JDoe')
end

Then(/^I should see the correct email$/) do
  page.has_content?('jane.doe@gmail.com')
end

Then(/^I should see errors on the page$/) do
  page.has_css?('div.field_with_errors')
end

Given(/^A user named Jane Doe exists$/) do
  visit(new_user_path)
  fill_in 'Name', :with => "Jane Doe"
  fill_in 'Username', :with => "JDoe"
  fill_in 'Email', :with => "jane.doe@gmail.com"
  click_button 'Create User'
end

Given(/^I am on the note creation page$/) do
  visit(new_note_path)
end

When(/^I fill in content$/) do
  fill_in "Content", :with => "gibberish"
end

When(/^I pick an owner$/) do
  select("JDoe", :from => 'Owner')
end

When(/^I click to create a new note$/) do
  click_button 'Create Note'
end

Then(/^I should see the new note's page$/) do
  page.has_content?("Note was successfully created")
end

Then(/^I should see the correct content$/) do
  page.has_content?("gibberish")
end

Then(/^I should see the correct user's username$/) do
  page.has_content?("JDoe")
end

Given (/^A note by Jane Doe is created$/) do
  visit(new_note_path)
  fill_in "Content", :with => "gibberish"
  select("JDoe", :from => 'Owner')
  click_button 'Create Note'
end

When(/^I click on the owner's username$/) do
  click_link('JDoe')
end

Then(/^I should be on the owner's page$/) do
  page.has_content?("Jane Doe")
  page.has_content?('JDoe')
  page.has_content?('jane.doe@gmail.com')
end
