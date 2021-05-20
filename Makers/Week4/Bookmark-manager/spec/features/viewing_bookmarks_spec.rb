

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    wipe_table
    # add_test_data
    bookmark = Bookmarks.add_bookmark(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.add_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmarks.add_bookmark(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Destroy All Software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
    # expect(page).to have_content "http://www.makersacademy.com"
    # expect(page).to have_content "http://www.destroyallsoftware.com"
    # expect(page).to have_content "http://www.google.com"
  end
end