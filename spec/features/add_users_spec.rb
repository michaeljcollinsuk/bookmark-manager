feature 'adding users' do
  scenario 'user signs up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, michael@email.com'
    # expect(User)
  end
end
