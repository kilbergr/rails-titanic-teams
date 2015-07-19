# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 t1 = Team.create(name: "Justice League", description: "Getting Justice", user_id: 4);
 rebecca = User.find_by_id(4)
 rebecca.is_admin = true
 rebecca.super_admin = true

 rebecca.teams << t1

 s1 = Superhero.create(name: "Wolverine", height: 63, bio: "Wolverine has claws but is basically a rodent.", image_url: "https://comicgamersassemble.files.wordpress.com/2014/06/wolverine-comics.jpg?w=900")
 s2 = Superhero.create(name: "Wonder Woman", height: 70, bio: "An Amazonian like something you've never seen before!", image_url: "http://www.blastr.com/sites/blastr/files/Wonder-Woman_0.jpg")
 s3 = Superhero.create(name: "Spider Man", height: 72, bio: "Bitten by a spider, lived to tell the tale.", image_url: "http://vignette1.wikia.nocookie.net/deathbattle/images/4/4b/Spiderman_png_by_captainjackharkness-d5cbru1.png/revision/latest?cb=20141120012050")
 t1.superheros << s1
 t1.superheros << s2
 t1.superheros << s3