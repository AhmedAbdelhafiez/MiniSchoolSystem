# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(username: "Alex",fullname: "Alex Adam",
dateOfBirth: DateTime.current.to_date);

Teacher.create(levelNo: 1, user_id: User.last.id);

User.create(username: "Ahmed",fullname: "Abdelhafiez",
dateOfBirth: DateTime.current.to_date);

Teacher.create(levelNo: 2, user_id: User.last.id);


4.times do |n|
  username = Faker::Name.name
  fullname = Faker::Name.name
  dateOfBirth = Faker::Date.backward(days: n)

  User.create!(username: username,
    fullname: fullname,
    dateOfBirth: dateOfBirth)

  Student.create!(classNo: n, user_id: User.last.id)

end
