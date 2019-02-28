require 'csv'

Match.destroy_all
Coupon.destroy_all
Bar.destroy_all
MeetUpTime.destroy_all
Swipe.destroy_all
User.destroy_all


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

puts "Creating bars"
CSV.foreach('db/bars.csv', csv_options) do |row|
  Bar.create!(name:row['name'], location:row['location'], description:row['description'])
end


puts "Creating male users"
anders = User.create(email: "andersthorson@gmail.com", password: "123456", name: "Anders", age: 23, location: 'London', gender: 'male')
anders.bio = ""
christian = User.create(email: "christiandaley@gmail.com", password: "123456", name: "Christian", age: 21, location: 'London', gender: 'male')
christian.bio = "Looking at my phone searching for a reason to stop looking at my phone. "
tom = User.create(email: "tomfrey@gmail.com", password: "123456", name: "Tom", age: 20, location: 'London', gender: 'male')
tom.bio = "Tacos, Bicycles, Cats, Chilling, Tattoos, Tacos, Nonsense, New Things, You. Did I say tacos? Tacos."
matt = User.create(email: "matthansen@gmail.com", password: "123456", name: "Matt", age: 28, location: 'London', gender: 'male')
matt.bio = "Looking for someone who likes making fun of bad movies, checking out local bands, sleeping in on Sundays, and laughing at themselves. Hoping you can show me a thing or two about what you’re into too."
oliver = User.create(email: "oliverembacker@gmail.com", password: "123456", name: "Oliver", age: 29, location: 'London', gender: 'male')
oliver.bio = "I don’t want a partner in crime, I commit all my crimes on my own. I would never drag you into that. I floss. That’s how responsible I am. If you love dogs and sports, I’m down for whatever you are."

puts "Creating female users"
angela = User.create(email: "angelalaw@gmail.com", password: "123456", name: "Angela", age: 19, location: 'London', gender: 'female')
angela.bio = "Love to party, love going on adventures. Also Netflix and Chill."
pam = User.create(email: "pamvasquez@gmail.com", password: "123456", name: "Pam", age: 23, location: 'London', gender: 'female')
pam.bio = "I love roller coasters but the pirate ship ride completely terrifies me. I once backpacked around Lake Tahoe in 13 days. When I was 14 I got a concussion swing dancing."
caro = User.create(email: "carohilton@gmail.com", password: "123456", name: "Caro", age: 25, location: 'London', gender: 'female')
caro.bio = "About Me: I like to sing-talk, guys with messy hair, reading the New Yorker on Sunday mornings, and funny voices. About You: If you’re still reading, that’s pretty good. Let’s do this."
sara = User.create(email: "sarahenderson@gmail.com", password: "123456", name: "Sara", age: 27, location: 'London', gender: 'female')
sara.bio = "All happy girls are alike; every unhappy girl is unhappy in her own way. My kind of unhappy is full of self-deprecating humor, double IPAs, and is actually pretty rad. Let me know if you want to be miserable together."
marie = User.create(email: "mariecuvander@gmail.com", password: "123456", name: "Marie", age: 21, location: 'London', gender: 'female')
marie.bio = "I live my whole life setting up situations that will eventually lead to the phrase, “And then laughter and hilarity ensued…” Hoping this one will work out too."



def create_user_photos(user, user_list)
  photo_list = []
  5.times.each_with_index do |idx|
    photo_list << "https://res.cloudinary.com/dcteumtl0/image/upload/v1551190991/skal/users/#{user_list}#{idx+1}.jpg"
  end
  photo_list.each do |photo_url|
    photo = Photo.new(user: user)
    photo.remote_photo_url = photo_url
    photo.save
  end
end



def create_bar_photos(bar, dir)
  photo_list = []
  3.times.each_with_index do |idx|
    photo_list << "https://res.cloudinary.com/dcteumtl0/image/upload/v1551262327/skal/bars/#{dir}/#{idx+1}.jpg"
  end
  photo_list.each do |photo_url|
    photo = Photo.new(bar: bar)
    photo.remote_photo_url = photo_url
    photo.save!
  end
end

puts "Creating user photos"
create_user_photos(anders, 'anders')
create_user_photos(oliver, 'oliver')
create_user_photos(tom, 'tom')
create_user_photos(matt, 'matt')
create_user_photos(christian, 'christian')

create_user_photos(sara, 'sara')
create_user_photos(angela, 'angela')
create_user_photos(marie, 'marie')
create_user_photos(caro, 'caro')
create_user_photos(pam, 'pam')

puts "Creating bar photos"
bluedoor = Bar.first
create_bar_photos(bluedoor, 'bluedoor')
