

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    wipe_table
    add_test_data
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end