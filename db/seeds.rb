# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Homeless.destroy_all

Homeless.create({nickname: "Francisco", story: "lorem fefe fe fe f e", location: "Rue du repos, Lyon"})
Homeless.create({nickname: "Francisco", story: "lorem fefe fe fe f e", location: "Rue du repos, Lyon"})
Homeless.create({nickname: "Francisco", story: "lorem fefe fe fe f e", location: "Rue des 3 pierres, Lyon"})
Homeless.create({nickname: "Francisco", story: "lorem fefe fe fe f e", location: "Rue de l'Université, Lyon"})
