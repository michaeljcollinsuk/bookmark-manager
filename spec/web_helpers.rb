def create_links(url, title, tags)
  visit '/links/new'
  fill_in 'url', with: url
  fill_in 'title', with: title
  fill_in 'tags', with: tags
  click_button('Add')
end

def sign_up(args)
  visit '/users/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'humanslavesrgr8'
  fill_in 'password_confirmation', with: 'humanslavesrgr8'
  click_button('Sign up!')
end

def sign_up_bad
  visit '/users/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'humanslavesrgr8'
  fill_in 'password_confirmation', with: 'ilovehumans'
  click_button('Sign up!')
end

def sign_up(email: 'evil_kitty@dogslife.com',
            password: 'humanslavesrgr8',
            password_confirmation: 'humanslavesrgr8')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up!'
end
