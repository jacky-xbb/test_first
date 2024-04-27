Given('I am on the homepage') do
  visit '/'
end

Given('I click on the registration link') do
  click_on 'registration-link'
end

When('I fill in and submit the registration form') do
  fill_in 'Name', with: 'jdoe'
  fill_in 'Email', with: 'jdoe@example.com'
  fill_in 'Password', with: 'secret1234'
  fill_in 'Password confirmation', with: 'secret1234'
  click_on 'Sign up'
end

Then('I should see a registration confirmation message') do
  expect(page).to have_content('Welcome')
end

Then('I should receive a confirmation email') do
  step %("jdoe@example.com" should receive an email)
end
