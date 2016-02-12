require 'spec_helper'

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
    expect(page).to have_content('Password does not match the confirmation')
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')
  end

  scenario 'user cannot sign up when email not entered' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up with invalid email format' do
    expect { sign_up(email: 'wrong.format') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
