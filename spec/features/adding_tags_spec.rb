feature 'adding tags' do
  scenario 'add a single tag' do
    add_full_entry
    link = Link.first
    expect(link.tags.map(&:name)).to include('CCC')
  end

  scenario 'add multiple tags' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tag', with: 'search news'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'news')
  end
end
