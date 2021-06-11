# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


csv_text = File.read(Rails.root.join('lib', 'seeds', 'locations.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
puts csv_text
csv.each do |row|
    t = Location.new
    t.name = row['name']
    t.city = row['city']
    puts "#{t.name}, #{t.city} saved"
    t.save
  end
 puts "There are now #{Location.count} rows in the locations table"




csv_text = File.read(Rails.root.join('lib', 'seeds', 'work_orders.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
puts csv_text
csv.each do |row|
    t = WorkOrder.new
    t.user_id = row['user_id']
    t.location_id = row['location_id']
    t.time = row['time']
    t.duration = row['duration']
    t.price = row['price']
    puts "#{t.user_id}, #{t.location_id}, #{t.time}, #{t.duration}, #{t.price}, saved"
    t.save
  end
 puts "There are now #{WorkOrder.count} rows in the work orders table"


 csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
puts csv_text
csv.each do |row|
    t = User.new
    t.name = row['name']
    puts "#{t.name} saved"
    t.save
  end
 puts "There are now #{User.count} rows in the users table"

 
 
 
 