require( 'pry-byebug' )
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({"name" => "Gryffindor"})
house1.save()

house2 = House.new({"name" => "Ravenclaw"})
house2.save()

house3 = House.new({"name" => "Hufflepuff"})
house3.save()

house4 = House.new({"name" => "Slytherin"})
house4.save()


student1 = Student.new({
  "first_name" => "Dave",
  "second_name" => "Donaldson",
  "house_id" => house2.id,
  "age" => "38"
  })

student1.save()

student2 = Student.new({
  "first_name" => "Mike",
  "second_name" => "Urquhart",
  "house_id" => house3.id,
  "age" => "40"
  })

student2.save()








binding.pry

nil
