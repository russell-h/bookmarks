require 'bookmarks'


describe Bookmarks do
  describe '.all' do
    it 'returns alll bookmarks' do
      wipe_table
      add_test_data
      bookmarks = Bookmarks.all

      expect(bookmarks).to include ("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
  describe '.add_bookmark' do
    it 'creates a new bookmark' do
      Bookmarks.add_bookmark(url: 'http://www.testbookmark.com')
  
      expect(Bookmarks.all).to include 'http://www.testbookmark.com'
    end
  end
end