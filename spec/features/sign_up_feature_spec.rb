require 'spec_helper'
require './app/app.rb'

feature 'Signing up and user accounts' do
  scenario 'new user signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, evil_kitty@dogslife.com')
    expect(User.first.email).to eq("evil_kitty@dogslife.com")
  end

  scenario 'user cannot sign up when password does not match' do
    expect { sign_up(password_confirmation: 'wrong') }
    .not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Passwords do not match')
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')
  end

  scenario 'user cannot sign up when email not entered' do
    expect { sign_up(email: '') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  scenario 'user cannot sign up with invalide email format' do
    expect { sign_up(email: 'wrong.format') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end
end
