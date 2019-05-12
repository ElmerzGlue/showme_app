# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create the admin user
User.create({name: 'Tournament Admin', school: 'N/A', email: 'showmemocktrial@gmail.com', 
	password: 'password', password_confirmation: 'password'})