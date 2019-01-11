# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds' , 'regional.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   r = Regional.new
#  r.province_id = row['province_id']
# #r.save
# puts row.to_hash
# end

@prov = Province.all
@reg = Regional.all
@kec = Subdistrict.all
if @kec.present? && @prov.present? && @reg.present?
  puts "Error, you must to destroy your data on the table and please reset your id. \n example: ALTER SEQUENCE provinces_id_seq RESTART WITH 1 "
else
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'province.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    r = Province.new
    r.name = row['name']
    r.save
    puts row.to_hash
  end
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'regional.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    r = Regional.new
    r.province_id = row['province_id']
    r.name = row['name']
    r.save
    puts row.to_hash
  end
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'subdistrict.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    r = Subdistrict.new
    r.regional_id = row['regional_id']
    r.name = row['name']
    r.save
    puts row.to_hash
  end
end
