# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: John@gmail.com, name: "John", password: "Qwerty@123", role: "admin")
User.create(email: Joe@gmail.com, name: "Joe", password: "Qweasd@123", role: "user")
User.create(email: Ross@gmail.com, name: "Ross", password: "Wsxqaz@123", role: "user")
User.create(email: Lily@gmail.com, name: "Lily", password: "Hello@123", role: "user")

park_spots =[
{ spots: "1", vtype: 2, status: 1 },
{ spots: "2", vtype: 2, status: 1 },
{ spots: "3", vtype: 2, status: 0 },
{ spots: "4", vtype: 2, status: 0 },
{ spots: "5", vtype: 2, status: 0 },
{ spots: "1", vtype: 4, status: 1 },
{ spots: "2", vtype: 4, status: 1 },
{ spots: "3", vtype: 4, status: 0 },
{ spots: "4", vtype: 4, status: 0 },
{ spots: "5", vtype: 4, status: 0 },
{ spots: "6", vtype: 4, status: 0 }
]

Spot.create!(park_spots)

customer = [
{ vnum: "MH21EF1232", vtype: 2, entry: "2023-02-08 07:55:46.448483", exit: "2023-02-08 11:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA21EF1232", vtype: 4, entry: "2023-02-09 05:55:46.448483", exit: "2023-02-09 09:59:52.398251", price: 450, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH21EF1232", vtype: 2, entry: "2023-02-08 07:55:46.448483", exit: "2023-02-08 12:59:52.398251", price: 500, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA21EF1232", vtype: 4, entry: "2023-02-09 05:55:46.448483", exit: "2023-02-09 09:59:52.398251", price: 60, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH23EF1232", vtype: 2, entry: "2023-02-10 07:55:46.448483", exit: "2023-02-10 19:59:52.398251", price: 70, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA20EF1232", vtype: 4, entry: "2023-02-09 05:55:46.448483", exit: "2023-02-09 09:59:52.398251", price: 150, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH21EF1212", vtype: 2, entry: "2023-02-11 07:55:46.448483", exit: "2023-02-11 16:59:52.398251", price: 250, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "TN21EF1232", vtype: 4, entry: "2023-02-12 05:55:46.448483", exit: "2023-02-12 09:59:52.398251", price: 150, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH20TB3452", vtype: 2, entry: "2023-02-13 07:55:46.448483", exit: "2023-02-13 17:59:52.398251", price: 180, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "TN21EF1232", vtype: 4, entry: "2023-02-14 05:55:46.448483", exit: "2023-02-14 09:59:52.398251", price: 90, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "DL21TY1232", vtype: 2, entry: "2023-02-15 07:55:46.448483", exit: "2023-02-15 17:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA21HU1232", vtype: 4, entry: "2023-02-15 05:55:46.448483", exit: "2023-02-15 09:59:52.398251", price: 900, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH21TR1232", vtype: 2, entry: "2023-02-14 07:55:46.448483", exit: "2023-02-14 17:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KL21LL1232", vtype: 4, entry: "2023-02-16 05:55:46.448483", exit: "2023-02-16 09:59:52.398251", price: 650, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH21EF3432", vtype: 2, entry: "2023-02-16 07:55:46.448483", exit: "2023-02-16 17:59:52.398251", price: 250, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA21YH5532", vtype: 4, entry: "2023-02-17 05:55:46.448483", exit: "2023-02-17 09:59:52.398251", price: 850, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH18EF1232", vtype: 2, entry: "2023-02-18 07:55:46.448483", exit: "2023-02-18 10:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA22EF9232", vtype: 4, entry: "2023-02-19 05:55:46.448483", exit: "2023-02-19 09:59:52.398251", price: 450, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH33EF6232", vtype: 2, entry: "2023-02-20 07:55:46.448483", exit: "2023-02-20 10:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA44EF5232", vtype: 4, entry: "2023-02-20 05:55:46.448483", exit: "2023-02-20 09:59:52.398251", price: 450, spots: "1", spot_id:6, email:"example@example.com"}
{ vnum: "MH47EF4232", vtype: 2, entry: "2023-02-23 07:55:46.448483", exit: "2023-02-23 10:59:52.398251", price: 350, spots: "1", spot_id:1, email:"example@example.com"}
{ vnum: "KA13EF3232", vtype: 4, entry: "2023-02-22 05:55:46.448483", exit: "2023-02-22 09:59:52.398251", price: 450, spots: "1", spot_id:6, email:"example@example.com"}

{ vnum: "MH21EM1232", vtype: 2, entry: "2023-02-23 07:55:46.448483", exit: nil, price: nil, spots: "1", spot_id:1,  email:"example@example.com"}
{ vnum: "KA21EF1232", vtype: 2, entry: "2023-02-22 12:55:46.448483", exit: nil, price: nil, spots: "2", spot_id:2,  email:"example@example.com"}
{ vnum: "KA03EF1222", vtype: 4, entry: "2023-02-10 10:40:46.448483", exit: nil, price: nil, spots: "1", spot_id:6,  email:"example@example.com"}
{ vnum: "MH25ET1236", vtype: 4, entry: "2023-02-24 07:55:46.448483", exit: nil, price: nil, spots: "2", spot_id:7,  email:"example@example.com"}

]
Customer.create!(customer)