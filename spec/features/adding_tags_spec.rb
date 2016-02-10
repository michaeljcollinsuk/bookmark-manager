feature 'adding tags' do
  scenario 'clicking add tag button' do
    add_full_entry
    within 'ul#links' do
      expect(page).to have_content('CCC')
    end
  end
end