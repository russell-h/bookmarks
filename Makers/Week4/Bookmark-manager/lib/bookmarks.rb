require 'pg'

class Bookmarks
  def self.all
    con = PG.connect :dbname => 'bookmark_manager'

    rs = con.exec "SELECT * FROM bookmarks"

    list = rs.map { |bookmark| bookmark['url'] }
    return list
  end
end 