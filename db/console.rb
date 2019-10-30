require("pry")
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new( {'name' => 'Juan'} )

artist1.save()

album1 = Album.new( {'title' => 'Juan Night in Heaven', 'genre' => 'jazz', 'artist_id' => artist1.id} )

album1.save()


artist2 = Artist.new( {'name' => 'Eugene'} )

artist2.save

album2 = Album.new( {'title' => 'Eugene\'s Blue Jeans', 'genre' => 'country', 'artist_id' => artist2.id} )

album2.save()

album3 = Album.new( {'title' => 'Juan Way Road', 'genre' => 'mumblecore', 'artist_id' => artist1.id} )
album3.save

binding.pry

nil
