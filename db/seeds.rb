# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PointsMenu.create(name: "first_name", spanish_name: "nombre", amount: 10)
PointsMenu.create(name: "last_name", spanish_name: "apellido", amount: 10)
PointsMenu.create(name: "phone_number", spanish_name: "telefono", amount: 10)
PointsMenu.create(name: "date_of_birth", spanish_name: "cumpleaños", amount: 10)
PointsMenu.create(name: "avatar_file_name", spanish_name: "avatar", amount: 50)


Role.create(name: "store_admin")