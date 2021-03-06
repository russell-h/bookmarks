require 'bookmarks'
require 'byebug'


describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      wipe_table
      

    bookmark = Bookmarks.add_bookmark(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.add_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmarks.add_bookmark(url: "http://www.google.com", title: "Google")


    bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end
  end


  describe '.add_bookmark' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.add_bookmark(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id}")
  
      expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
   
    it 'deletes the given bookmark' do
      wipe_table
      bookmark = Bookmarks.add_bookmark(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq 0
    end
  end
end