feature "add new bookmarks" do
  scenario "adding to the list" do
    wipe_table
    add_test_data
    visit('/bookmarks')
    fill_in('url', :with => 'http://www.youtube.com')
    click_button('Submit')
    expect(page).to have_content "http://www.youtube.com"
  end
end