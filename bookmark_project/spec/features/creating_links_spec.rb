
feature 'Creates links to links table' do
  scenario 'adds a link' do
    visit '/new'
      fill_in('title', with: 'YouTube')
      fill_in('url', with: 'http://www.youtube.com')
      click_button('Add_link')
  end
end
