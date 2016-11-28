# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
InstaUser.destroy_all

jo = User.new(email:"jomourot@supper-battle.com", password:"azerty")
jo.save!

paal = User.new(email:"paal@supper-battle.com", password:"azerty")
paal.save!

zguy = User.new(email:"zguy@supper-battle.com", password:"azerty")
zguy.save!


beyonce = InstaUser.new(profile_picture: "url", first_name:"Beyoncé", last_name:"Beyoncé", bio:"coucou c'est beyoncé", media:8, follow:10, followed_by:30, user_id:jo.id )
beyonce.save!


shakira = InstaUser.new(profile_picture: "url", first_name:"shakira", last_name:"shakira", bio:"coucou c'est shakira", media:8, follow:10, followed_by:30, user_id:paal.id )
shakira.save!


