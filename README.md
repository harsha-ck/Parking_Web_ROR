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
  bin/rails generate model users uid:integer name:string password:string role:string

* Add mailer for customer
  bin/rails generate mailer customer
  bin/rails generate mailer user

* Add your gmail id and password in config/environments/development.rb file. (For safety purpose generate app password for your gmail account)

* Add your gmail in mailers/customer_mailer in default from.

* Keep side `redis-server` and `sidekiq` running in terminal to send gmail.

* Make sure postfix is installed in the system

* Add Rake tasks to send gmail at 8 pm daily if vehicle parked for more than then 2 days

* Add schedule.rb to set the time which can be added to crontab
  bundle exec wheneverize # this will create schedule.rb
  bundle exec whenever --update-crontab # by default it will be in production
  whenever --update-crontab --set environment='development' # to update crontab after adding code in schedule.rb for development
  crontab -l # to check if crontab is updated

* Add routes as it is there in app/config/routes.yml file

* Add gem 'mysql2', '~> 0.5.3', gem 'bcrypt', '~> 3.1.7' to gemfile and run
  bundle install

* To change time from utc to itc or any other add in config/application.rb and config/environments/developments.rb
  config.time_zone = 'Asia/Kolkata'

* To covert time zone in database in terminal
  mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -pYourPassword mysql # -pyourpassword without space.

* To check run this in mysql server
  SELECT CONVERT_TZ(created_at, 'UTC', 'Asia/Kolkata') AS created_at_indian_time FROM users;

* To create new database
  bin/rails db:create

* To add email field in users and customer table
  rails generate migration add_email_to_users email:string
  rails generate migration add_email_to_customer email:string

* To add policies to the controller # make sure you have pundit gem
  rails generate pundit:install
  rails generate pundit:policy User
  rails generate pundit:policy Spot
  rails generate pundit:policy Customer


* Remove uid from users table
  rails generate migration remove_user_id_from_users uid:integer

* Database migration
  bin/rails db:migrate #if database exists skip above command

* To seed database
  bin/rails db:seed

* Login details for admin Email:John@gmail.com Password: Qwerty@123

* Login details for user Email and Password(given in db/seeds.rb file).

* To check database in console
  bin/rails console

* Create _form.html.erb in app/views/spots file for same view to edit/add.

* Create _navbar.html.erb in views/layouts for navbar in header.

* To configure database or change database customer or password app/config/database.yml

* Run the project
  bin/rails server

* First click on Add spots to add spots, to view, edit or delete spots can be done in all spots.

* To insert customers click on check in and to log out click check out. 
