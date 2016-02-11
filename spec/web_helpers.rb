def sign_up
  visit '/users/new'
  fill_in 'email', with: 'michael@email.com'
  # fill_in 'password', with: 'p4ssword'
  click_button 'Sign up'
end
