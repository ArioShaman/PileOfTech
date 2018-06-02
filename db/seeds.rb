# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = File.open('/home/arioshaman/project/PileOfTech/app/assets/images/food-sm.png')

Project.create(
  title: 'Test Test',
  description: 'adadasd',
  kind: 'website',
  link: 'http://pileof.tech',
  small_cover: file
)

Image.create(
  image: file,
  project_id: 1
)

Image.create(
  image: file,
  project_id: 1
)

Image.create(
  image: file,
  project_id: 1
)

Image.create(
  image: file,
  project_id: 1
)