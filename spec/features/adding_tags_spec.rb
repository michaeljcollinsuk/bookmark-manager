feature 'Adding tags to a link' do
  scenario 'adding a single tag to a link' do
    visit '/links'
    click_button 'Add link'
    fill_in 'title', with: "BBC"
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'tags', with: 'news'
    click_button 'Submit'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('news')
    end
    # link = Link.first
    # expect(link.tags.map(&:name)).to include('news')

  end

  scenario 'adding a single tag to a link' do
    visit '/links'
    click_button 'Add link'
    fill_in 'title', with: "football365"
    fill_in 'url', with: 'www.football365.com'
    fill_in 'tags', with: 'football sport'
    click_button 'Submit'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('football sport')
    end
  end
end
