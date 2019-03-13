require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name'=>'The Strokes'})
artist1.save
artist2 = Artist.new({'name'=>'Abba'})
artist2.save
artist3 = Artist.new({'name'=>'Remove Me!'})
artist3.save


album1 = Album.new({'title'=>'You only live once', 'genre'=>'indie rock', 'artist_id'=> artist1.id})
album1.save
album2 = Album.new({'title'=>'Someday', 'genre'=>'indie rock', 'artist_id'=> artist1.id})
album2.save
album3 = Album.new({'title'=>'Gold Hits', 'genre'=>'pop', 'artist_id'=> artist2.id})
album3.save
album4 = Album.new({'title'=>'remove me', 'genre'=>'pop', 'artist_id'=> artist2.id})
album4.save

# p Artist.list_all
# p Album.list_all
# p artist2.albums
# p album1.artist
# artist1.name = 'Changed'
# artist1.update
# album1.title = 'You only live twice'
# album1.update
# artist3.delete
# album4.delete
# result = Artist.find(artist1.id)
# p result
# result = Album.find(album2.id)
# p result
