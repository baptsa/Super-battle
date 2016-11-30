# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = RestClient.get "https://api.instagram.com/v1/users/self/follows?access_token=2024147607.8121a2b.aebb392adc3f4ab98efa6e4025caaa40"
repos = JSON.parse(response)
id_table = repos.first(10)
id_table.each do |id|
  result = RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{id}.json")
  post = Post.new(name: result["title"], url: result["url"], votes: result["score"])
  post.save!
end






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


