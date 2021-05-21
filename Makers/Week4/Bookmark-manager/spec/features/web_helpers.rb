require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end

def wipe_table

  con = PG.connect :dbname => 'bookmark_manager_test'

  rs = con.exec "TRUNCATE TABLE bookmarks"

end


# def add_test_data
#   Bookmarks.add_bookmark(title: 'Google', url: 'http://www.google.com')
#   Bookmarks.add_bookmark(title: 'makers', url: 'http://www.makersacademy.com')
#   Bookmarks.add_bookmark(title: 'DAS', url: 'http://www.destroyallsoftware.com')
# end