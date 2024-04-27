Given('I already have an account') do
  visit '/'
  click_on 'registration-link'
  fill_in 'Name', with: 'jdoe'
  fill_in 'Email', with: 'jdoe@example.com'
  fill_in 'Password', with: 'secret1234'
  fill_in 'Password confirmation', with: 'secret1234'
  click_on 'Sign up'
end

When('I sign out') do
  click_on 'signout_link'
  expect(page).to have_content('Signed out successfully')
end

When('I try to register with the same email') do
  step %(I already have an account)
end

Then('I should see an error message') do
  # pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_content('Email has already been taken')
end
