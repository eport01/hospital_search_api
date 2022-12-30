# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'pry'

Hospital.destroy_all

i = 0
CSV.foreach('./db/data/hospitals.csv') do |row|
    i+=1
    next if i ==1
    data = {
      id: row[3], 
      name: row[4], 
      address: row[5], 
      city: row[6], 
      state: row[7], 
      zip: row[8], 
      beds: row[31], 
      trauma: row[32]
      }
    Hospital.create(data)
end 