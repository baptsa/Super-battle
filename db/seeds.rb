# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jo = User.create!(email:"jomourot@supper-battle.com", password:"azerty")
paal = User.create!(email:"paal@supper-battle.com", password:"azerty")
zguy = User.create!(email:"zguy@supper-battle.com", password:"azerty")
baptiste = User.create!(email:"baptiste@super-battle.com", password:"azerty")
romain = User.create!(email:"romain@super-battle.com", password:"azerty")

InstaUser.create!({
  username:          "Beyonce",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/s320x320/12918039_230227960666719_282379501_a.jpg",
  first_name:        "Beyoncé",
  last_name:         "Beyoncé",
  bio:               "coucou c'est beyoncé",
  media:             8,
  follow:            10,
  followed_by:       30,
  user_id:           jo.id
})

InstaUser.create!({
  username:          "Mr Holland",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/s320x320/12917992_895774263873055_1966939033_a.jpg",
  first_name:        "François",
  last_name:         "Hollande",
  bio:               "Coucou, c'est Hollande",
  media:             321,
  follow:            1345,
  followed_by:       10000,
  user_id:           jo.id
})


InstaUser.create!({
  username:          "shakira",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/s320x320/15101730_833344936808672_3706769398803988480_a.jpg",
  first_name:        "shakira",
  last_name:         "shakira",
  bio:               "coucou c'est shakira",
  media:             10,
  follow:            20,
  followed_by:       100,
  user_id:           paal.id
})



# User.destroy_all
# InstaUser.destroy_all

# jo = User.new(email:"jomourot@supper-battle.com", password:"azerty")
# jo.save!

# paal = User.new(email:"paal@supper-battle.com", password:"azerty")
# paal.save!

# zguy = User.new(email:"zguy@supper-battle.com", password:"azerty")
# zguy.save!


# beyonce = InstaUser.new(username: "Beyonce", profile_picture: "url", first_name:"Beyoncé", last_name:"Beyoncé", bio:"coucou c'est beyoncé", media:8, follow:10, followed_by:30, user_id:jo.id )
# beyonce.save!


# shakira = InstaUser.new(username: "Shakira-Shakira", profile_picture: "url", first_name:"shakira", last_name:"shakira", bio:"coucou c'est shakira", media:8, follow:10, followed_by:30, user_id:paal.id )
# shakira.save!

InstaUser.create!({
  username:          "Barack Obama",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/s320x320/12345756_1206817265997207_288075195_a.jpg",
  first_name:        "Barack",
  last_name:         "Obama",
  bio:               "I am still the president",
  media:             122,
  follow:            340,
  followed_by:       1023,
  user_id:           paal.id
})

InstaUser.create!({
  username:          "Michael Phelps",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/s320x320/14134712_1142642795792654_2109380723_a.jpg",
  first_name:        "Michael",
  last_name:         "Phelps",
  bio:               "I am an OL gold medal winner",
  media:             122,
  follow:            340,
  followed_by:       1024,
  user_id:           paal.id
})

InstaUser.create!({
  username:          "Lionel Messi",
  profile_picture:   "https://scontent-cdg2-1.cdninstagram.com/t51.2885-19/11374627_416190928582643_995636312_a.jpg",
  first_name:        "Lionel",
  last_name:         "Messi",
  bio:               "I am the best football player",
  media:             122,
  follow:            349,
  followed_by:       91023,
  user_id:           paal.id
})


# fight1 = Fight.create!(challenger_id: 1, opponent_id: 2)
# fight2 = Fight.create!(challenger_id: 1, opponent_id: 2)
# fight3 = Fight.create!(challenger_id: 3, opponent_id: 4)
# fight4 = Fight.create!(challenger_id: 3, opponent_id: 4)
# Fight.create!(challenger_id: 5, opponent_id: 1)


# beyonce = InstaUser.create!(username: "Beyonce", profile_picture: "url", first_name:"Beyoncé", last_name:"Beyoncé", bio:"coucou c'est beyoncé", media:8, follow:10, followed_by:30, user_id:jo.id )
# shakira = InstaUser.new(username: "Shakira-Shakira", profile_picture: "url", first_name:"shakira", last_name:"shakira", bio:"coucou c'est shakira", media:8, follow:10, followed_by:30, user_id:paal.id )
# shakira.save!
# zguy = User.new(email:"zguy@supper-battle.com", password:"azerty")
# zguy.save!

