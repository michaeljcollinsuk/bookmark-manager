feature 'filtering by tags' do
  scenario 'page shows only links tagged with bubbles' do
    Link.create(url: 'AAA', title: 'BBB', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'ZZZ', title: 'XXX', tags: [Tag.first_or_create(name: 'nothing')])
      visit '/tags/bubbles'
      within 'ul#links' do
        expect(page).to have_content 'AAA'
        expect(page).not_to have_content 'ZZZ'
      end
  end
end