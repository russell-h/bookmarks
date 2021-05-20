feature "add new bookmarks" do
  scenario "adding to the list" do
    wipe_table
    # add_test_data
    visit('/bookmarks')
    fill_in('url', :with => 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: "http://www.testbookmark.com")
  end
end