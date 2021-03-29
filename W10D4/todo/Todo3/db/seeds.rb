# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do
  Todo.destroy_all

  puts "Creating todos..."

  green_todo = Todo.create!(title: "Green", body: '1.75' , done: false)
  oolong_todo = Todo.create!(title: "Oolong", body: '2.00', done: false)
  earl_grey_todo = Todo.create!(title: "Earl Grey", body: '2.50', done: false)
  rooibos_todo = Todo.create!(title: "Rooibos", body: '3.00', done: false)

 
end