
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
  assert page.has_content?("User was successfully created")
end

Then(/^I should see the correct name/) do
  assert page.has_content?("Jane Doe")
end

Then(/^I should see the correct username/) do
  assert page.has_content?('JDoe')
end

Then(/^I should see the correct email$/) do
  assert page.has_content?('jane.doe@gmail.com')
end

Then(/^I should see errors on the page$/) do
  assert page.has_css?('div.field_with_errors')
end

Given(/^I am on the note creation page$/) do
  visit(new_note_page)
end

When(/^I fill in content$/) do
  fill_in "Content", :with => "gibberish"
end

When(/^I pick an owner$/) do
  fill_in "Owner", :with => "JDoe"
end

When(/^I click to create a new note$/) do
  click_button 'Create Note'
end

Then(/^I should see the new note's page$/) do
  assert page.has_content?("Note was successfully created")
end

Then(/^I should see the correct content$/) do
  assert page.has_content?("gibberish")
end

Then(/^I should see the correct user's username$/) do
  assert page.has_content?("JDoe")
end

#how do i do set up with this so I can test properly?
# testuser = User.create(:name => "John Doe", :username => "TestUser", :email => "john.doe@gmail.com")
# mynote = Note.create(:content => "nothing important", :user_id => testuser.id)

Given(/^I am on the note page$/) do
  visit(note_page)
end

When(/^I click on the owner's username$/) do
  click_link('TestUser')
end

Then(/^I should be on the owner's page$/) do
  assert page.equal?(user_path(testuser))
end
