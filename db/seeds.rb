Swipe.destroy_all
User.destroy_all
Match.destroy_all

puts "Creating male users"
anders = User.create(email: "andersthorson@gmail.com", password: "123456", name: "Anders Thorson", age: 23, location: 'London')
anders.bio = ""
christian = User.create(email: "christiandaley@gmail.com", password: "123456", name: "Christian Daley", age: 21, location: 'London')
christian.bio = "Looking at my phone searching for a reason to stop looking at my phone. "
tom = User.create(email: "tomfrey@gmail.com", password: "123456", name: "Tom Frey", age: 20, location: 'London')
tom.bio = "Tacos, Bicycles, Cats, Chilling, Tattoos, Tacos, Nonsense, New Things, You. Did I say tacos? Tacos."
matt = User.create(email: "matthansen@gmail.com", password: "123456", name: "Matt Hansen", age: 28, location: 'London')
matt.bio = "Looking for someone who likes making fun of bad movies, checking out local bands, sleeping in on Sundays, and laughing at themselves. Hoping you can show me a thing or two about what you’re into too."
oliver = User.create(email: "oliverembacker@gmail.com", password: "123456", name: "Oliver Embacher", age: 29, location: 'London')
oliver.bio = "I don’t want a partner in crime, I commit all my crimes on my own. I would never drag you into that. I floss. That’s how responsible I am. If you love dogs and sports, I’m down for whatever you are."

puts "Creating female users"
kristina = User.create(email: "kristinaivanova@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London')
kristina.bio = "Love to party, love going on adventures. Also Netflix and Chill."
pam = User.create(email: "pamvasquez@gmail.com", password: "123456", name: "Pam Vasquez", age: 23, location: 'London')
pam.bio = "I love roller coasters but the pirate ship ride completely terrifies me. I once backpacked around Lake Tahoe in 13 days. When I was 14 I got a concussion swing dancing."
caro = User.create(email: "carohilton@gmail.com", password: "123456", name: "Caro Hilton", age: 25, location: 'London')
caro.bio = "About Me: I like to sing-talk, guys with messy hair, reading the New Yorker on Sunday mornings, and funny voices. About You: If you’re still reading, that’s pretty good. Let’s do this."
sara = User.create(email: "sarahenderson@gmail.com", password: "123456", name: "Sara Henderson", age: 27, location: 'London')
sara.bio = "All happy girls are alike; every unhappy girl is unhappy in her own way. My kind of unhappy is full of self-deprecating humor, double IPAs, and is actually pretty rad. Let me know if you want to be miserable together."
marie = User.create(email: "mariecuvander@gmail.com", password: "123456", name: "Marie Cuvander", age: 21, location: 'London')
marie.bio = "I live my whole life setting up situations that will eventually lead to the phrase, “And then laughter and hilarity ensued…” Hoping this one will work out too."

# photo_urls.each do |photo_url|
#   anders_photo1 = UserPhoto.new(user: anders)
#   anders_photo1.remote_photo_url = photo_url
#   anders_photo1.save
# end



