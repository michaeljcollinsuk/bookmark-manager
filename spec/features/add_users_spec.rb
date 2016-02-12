feature 'adding users' do
  scenario 'user signs up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, michael@email.com'
    expect(User.first.email).to eq('michael@email.com')
  end

  scenario 'user incorrectly confirms password' do
    expect{bad_sign_up}.to change(User, :count).by(0)
  end
end
