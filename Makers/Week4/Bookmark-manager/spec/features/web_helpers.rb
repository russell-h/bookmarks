
def wipe_table

  con = PG.connect :dbname => 'bookmark_manager_test'

  rs = con.exec "TRUNCATE TABLE bookmarks"

end


def add_test_data
  Bookmarks.add_bookmark(url: 'http://www.google.com')
  Bookmarks.add_bookmark(url: 'http://www.makersacademy.com')
  Bookmarks.add_bookmark(url: 'http://www.destroyallsoftware.com')
end