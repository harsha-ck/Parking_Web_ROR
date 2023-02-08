# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(uid: 1000, name: "John", password_digest: "Qwerty@123", role: "admin")
User.create(uid: 1001, name: "Joe", password_digest: "Qweasd@123", role: "user")
User.create(uid: 1002, name: "Ross", password_digest: "Wsxqaz@123", role: "user")
User.create(uid: 1003, name: "Lily", password_digest: "Hello@123", role: "user")

park_spots =[
{ spots: "1", vtype: 2, status: 0 },
{ spots: "2", vtype: 2, status: 0 },
{ spots: "3", vtype: 2, status: 0 },
{ spots: "4", vtype: 2, status: 0 },
{ spots: "5", vtype: 2, status: 0 },
{ spots: "1", vtype: 4, status: 0 },
{ spots: "2", vtype: 4, status: 0 },
{ spots: "3", vtype: 4, status: 0 },
{ spots: "4", vtype: 4, status: 0 },
{ spots: "5", vtype: 4, status: 0 },
{ spots: "6", vtype: 4, status: 0 }
]

Spot.create!(park_spots)