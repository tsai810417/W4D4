# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  User.create(email: "#{i}@google", password: "123456")
end

10.times do |i|
  Band.create(name: "Band ##{i}")
end

["Spring","Summer","Fall","Winter"].each_with_index do |t, i|
  Album.create!(band_id: i+2, year: i+2010, title: t, live: [true, false].sample, record_id: i*509)
end
