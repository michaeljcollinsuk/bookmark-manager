feature 'filtering links by tag' do
  scenario 'only links tagged bubble are displayed' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.bubbles.com', title: 'Bubble', tags: [Tag.first_or_create(name: 'bubbles')])
    visit '/links/bubbles'
    within 'ul#links' do
      expect(page).to have_content("http://www.bubbles.com")
      expect(page).not_to have_content("http://www.makersacademy.com")
    end
  end
end
