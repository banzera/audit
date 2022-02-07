# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Ensuring system user exists"
User.system_user

puts "Ensuring receving user exists"
User.find_or_create_by(email: 'receiving@au.com') do |user|
  user.first_name      = 'Receiving'
  user.last_name       = 'User'
  user.password        = ENV.fetch('INITIAL_ADMIN_PASSWORD')
  user.confirmed_at    = Time.current
  user.created_by_id   = 0
  user.is_admin        = false
end

puts "Ensuring accounting user exists"
User.find_or_create_by(email: 'accounting@au.com') do |user|
  user.first_name      = 'Accounting'
  user.last_name       = 'User'
  user.password        = ENV.fetch('INITIAL_ADMIN_PASSWORD')
  user.confirmed_at    = Time.current
  user.created_by_id   = 0
  user.is_admin        = false
end

def create_user(first, last)
  email = "#{last.downcase}#{first[0].downcase}@accelerate.dental"
  puts "Creating user for '#{email}'"
  User.find_or_create_by(email: email) do |user|
    user.first_name      = first
    user.last_name       = last
    user.password        = ENV.fetch('INITIAL_ADMIN_PASSWORD')
    user.confirmed_at    = Time.current
    user.created_by_id   = 0
    user.is_admin        = true
  end
end

create_user('Bryan', 'Banz')
create_user('Paul', 'Lock')
create_user('Matt', 'Henry')
create_user('LeeAnn', 'Shaw')
create_user('Katie', 'Mortinson')
create_user('Jimmy', 'Lock')
create_user('Linda', 'Swanson')
create_user('Lucas', 'Houk')
