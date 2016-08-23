## README

# MyArea by Adrian Mui

**myArea is an app that pulls up a static location for where you are and allows you to post PostComments
where other Users around the area can upvote or downvote your PostComment. The app can expand to include
POIs, Pokestops(PokemonGO), etc**

Models 

#Users OK

  -username
  -email
  -password
  
#Profile OK

  - first_name
  - last_name
  - address
  - city
  - state
  -has_one location

#Posts ..

  - belongs to user
  - Description
  - likes

#Comments ..
  - belongs to post
  - belongs to author(user)
  - likes

#Location IN\_PROGRESS
  - ???

APIs

google maps (static?) IN\_PROGRESS
  -google map static helper

sfo apis 
  -will include api info for map to contain special markers.

Niantic PKGO api
  -will definitely include pokestop markers (duh)

  GEM
   ty geocoder for converting address to LONG/LAT