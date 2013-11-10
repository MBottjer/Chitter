Given(/^I am logged in$/) do
  visit '/sign_up'
  fill_in 'email', with: 'michaelbottjer@hotmail.com'
  fill_in 'password', with: 'devesh'
  fill_in 'password_confirmation', with: 'devesh'
  fill_in 'name', with: 'Michael'
  fill_in 'user_name', with: 'mbottjer'
  click_button 'Sign Up'
end