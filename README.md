# README

This web application can add, list, edit, view and delete parking spots and check in, check out, list of parked customers,
all records and calculate price according to check in and check out.


* Ruby version
    ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]

* Creating new project
    rails new project_name

* Controller creation
    bin/rails generate controller Spots index show new edit
    bin/rails generate controller Customer index show new details checkout
    bin/rails generate controller Users new edit index login show

* Model creation
    bin/rails generate model spot spots:string vtype:integer status:boolean
    bin/rails generate model customer vnum:string vtype:string entry:datetime exit:datetime price:float spots:string spot:references
    bin/rails generate model users uid:integer name:string password_digest:string role:string

* Add routes as it is there in app/config/routes.yml file

* Add gem 'mysql2', '~> 0.5.3', gem 'bcrypt', '~> 3.1.7' to gemfile and run
    bundle install

* To change time from utc to itc or any other add in config/application.rb and config/environments/developments.rb
  config.time_zone = 'Asia/Kolkata'

* To create new database
    bin/rails db:create

* Database migration
    bin/rails db:migrate #if database exists skip above command

* To seed database
    bin/rails db:seed

* Login details for admin User ID: 1000 Password: Qwerty@123

* Login details for user User ID: 1001/1002/1003/1004 Password: Qweasd@123/Wsxqaz@123/Hello@123 respectively.

* To check database in console
    bin/rails console

* Create _form.html.erb in app/views/spots file for same view to edit/add.

* Create _navbar.html.erb in views/layouts for navbar in header.

* To configure database or change database customer or password app/config/database.yml

* Run the project
    bin/rails server

* First click on Add spots to add spots, to view, edit or delete spots can be done in all spots.

* To insert customers click on check in and to log out click check out. 