require 'bookmarks'


describe Bookmarks do
  describe '.all' do
    it 'returns alll bookmarks' do
      bookmarks = Bookmarks.all

      expect(bookmarks).to include ("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end