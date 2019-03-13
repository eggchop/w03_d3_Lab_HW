require_relative("../db/sql_runner.rb")
require_relative("./album.rb")

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def save
    sql = "INSERT INTO artists (name)
          VALUES ($1)
          RETURNING id"
    values = [@name]
    returned_array = SqlRunner.run(sql, values)
    artist_hash = returned_array.first
    id_string = artist_hash['id']
    @id = id_string.to_i
  end

  def self.list_all
    sql = "SELECT * FROM artists"
    returned_array = SqlRunner.run(sql)
    return returned_array.map{|artist| Artist.new(artist)}
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    returned_array = SqlRunner.run(sql,values)
    return returned_array.map{|album| Album.new(album)}
  end

  def update
    sql = 'UPDATE artists SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = 'DELETE FROM artists WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Artist.new(result)
  end

end
