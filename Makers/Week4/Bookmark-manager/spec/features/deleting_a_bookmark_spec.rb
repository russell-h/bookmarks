feature 'Deleting a bookmark' do
    scenario 'A user can delete a bookmark' do
      wipe_table
      Bookmarks.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/bookmarks')
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

      first('.bookmarks').click_button 'Delete'

      expect(current_path).to eq '/bookmarks'
      save_and_open_page
      expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    end
  end