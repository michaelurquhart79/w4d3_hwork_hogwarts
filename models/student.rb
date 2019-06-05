require( 'pry-byebug' )
require_relative('../db/sql_runner')


class Student
  attr_reader :id
  attr_accessor :first_name, :second_name, :house, :age


  def initialize(options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house,
      age
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
    values = [@first_name, @second_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    return Student.new(student)
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end
