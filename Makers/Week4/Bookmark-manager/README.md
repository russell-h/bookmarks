Bookmark Manager README:
-------------------------------  
Showing a list of bookmarks:
  As a user,
  To see a list of my favourite websites,
  Show me a list of bookmarks


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