Bookmark Manager README:
-------------------------------  
Showing a list of bookmarks:
  As a user,
  To see a list of my favourite websites,
  Show me a list of bookmarks

As a user,
So I can save my new favourite websites,
I'd like to be able to save new bookmarks to the list


user
bookmark list
website
view()

Client                    Controller                              Model           View
----------                ----------         .all -->           | bookmark|   |erb bookmarks|
|  user  |                | app.rb |  <-bookmarks please
----------                ----------
/bookmarks get request->          -----------------bookmarks------------------------>
          <-response              <------------------HTML---------------------------


## Installation 

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`