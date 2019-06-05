require( 'pry-byebug' )
require_relative('../db/sql_runner')

class House
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options["name"]
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO houses (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map{|house| House.new(house)}
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

end
