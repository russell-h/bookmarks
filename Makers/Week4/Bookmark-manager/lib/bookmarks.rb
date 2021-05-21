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

    rs.map  do |bookmark|
      Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) 
    end
    
  end

  def self.add_bookmark(url:, title:)
    if ENV['RACK_ENV'] == 'test'
      database_name = 'bookmark_manager_test'
    else 
      database_name = 'bookmark_manager'
    end

    con = PG.connect :dbname => database_name

    result = con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end


  def self.delete(id:)
    if ENV['RACK_ENV']  == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

end 