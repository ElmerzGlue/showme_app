# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create the admin user
User.create({name: 'Tournament Admin', phone: '(314) 555-1234', email: 'showmemocktrial@gmail.com',
             school: 'N/A', password: ENV["ADMIN_PASSWORD"], password_confirmation: ENV["ADMIN_PASSWORD"], admin: true,
             activated: true, paid_registration: true, paid_tournament: true, activated_at: Time.zone.now})