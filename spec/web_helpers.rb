def add_full_entry
  visit '/links/new'
  fill_in 'title', with: 'AAA'
  fill_in 'url', with: 'BBB'
  fill_in 'tag', with: 'CCC'
  click_button 'Submit'
end