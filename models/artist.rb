require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

attr_reader :id, :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']

end

  def save()
   #  sql = "INSERT INTO artists(name)
   #  VALUES
   #  ($1)
   #  RETURNING id;
   #  "
   # values = [@name]
   # results = SqlRunner.new( sql, values )
   # @id = results[0]['id'].to_i
   db = PG.connect( {dbname: 'music_collection', host: 'localhost'} )
   sql = "INSERT INTO artists
   (name)
   VALUES
   ($1)
   RETURNING id;
   "
   values = [@name]
   db.prepare("save", sql)
   result = db.exec_prepared("save", values)
   db.close()
   @id = result[0]['id'].to_i

  end

  def album_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values)
    albums = results.map{ |album| Album.new( album )}
    return albums

  end


  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end









end
