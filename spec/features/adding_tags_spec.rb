feature 'adding tags' do
  scenario 'add a single tag' do
    add_full_entry
    link = Link.first
    expect(link.tags.map(&:name)).to include('CCC')
  end
end
