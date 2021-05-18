require 'pg'

class Bookmarks
  def self.all
    if ENV['RACK_ENV'] == 'test'
      database_name = 'bookmark_manager_test'
    else 
      database_name = 'bookmark_manager'
    end


    con = PG.connect :dbname => database_name
    
    rs = con.exec "SELECT * FROM bookmarks"

    list = rs.map { |bookmark| bookmark['url'] }
    return list
  end

  def self.add_bookmark(url:)
    if ENV['RACK_ENV'] == 'test'
      database_name = 'bookmark_manager_test'
    else 
      database_name = 'bookmark_manager'
    end

    con = PG.connect :dbname => database_name

    rs = con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}');"
  end
end 