## README

# MyArea by Adrian Mui

** myArea is an app that pulls up a static location for where you are and allows you to post PostComments
where other Users around the area can upvote or downvote your PostComment. The app can expand to include
POIs, Pokestops(PokemonGO), etc **

Models 

Users
  -username
  -email
  -password
  -location (findme button)
Posts
  - belongs to user
  - Description
  - likes
Comments
  - belongs to post
  - belongs to author(user)
  - likes

APIs

google maps (static?)
  -google map static helper