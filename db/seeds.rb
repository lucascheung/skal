require 'csv'

User.destroy_all
Coupon.destroy_all
Bar.destroy_all
MeetUpTime.destroy_all
Match.destroy_all
Swipe.destroy_all

# puts "Creating Users"
# bob = User.create(email: "bob@gmail.com", password: "123456")
# mary = User.create(email: "mary@gmail.com", password: "123456")
# susan = User.create(email: "susan@gmail.com", password: "123456")
# sue = User.create(email: "sue@gmail.com", password: "123456")
# gillian = User.create(email: "gillian@gmail.com", password: "123456")
# carol = User.create(email: "carol@gmail.com", password: "123456")
# puts "Done with users"
# chicks = [mary, susan, sue, gillian, carol]


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach('db/bars.csv', csv_options) do |row|
  Bar.create!(name:row['name'], location:row['location'], description:row['description'])
end



puts "Creating male users"
anders = User.create(email: "andersthorson@gmail.com", password: "123456", name: "Anders Thorson", age: 23, location: 'London', gender: 'Male')
anders.bio = ""
christian = User.create(email: "christiandaley@gmail.com", password: "123456", name: "Christian Daley", age: 21, location: 'London', gender: 'Male')
christian.bio = "Looking at my phone searching for a reason to stop looking at my phone. "
tom = User.create(email: "tomfrey@gmail.com", password: "123456", name: "Tom Frey", age: 20, location: 'London', gender: 'Male')
tom.bio = "Tacos, Bicycles, Cats, Chilling, Tattoos, Tacos, Nonsense, New Things, You. Did I say tacos? Tacos."
matt = User.create(email: "matthansen@gmail.com", password: "123456", name: "Matt Hansen", age: 28, location: 'London', gender: 'Male')
matt.bio = "Looking for someone who likes making fun of bad movies, checking out local bands, sleeping in on Sundays, and laughing at themselves. Hoping you can show me a thing or two about what you’re into too."
oliver = User.create(email: "oliverembacker@gmail.com", password: "123456", name: "Oliver Embacher", age: 29, location: 'London', gender: 'Male')
oliver.bio = "I don’t want a partner in crime, I commit all my crimes on my own. I would never drag you into that. I floss. That’s how responsible I am. If you love dogs and sports, I’m down for whatever you are."

puts "Creating female users"
angela = User.create(email: "angelalaw@gmail.com", password: "123456", name: "Angela Law", age: 19, location: 'London', gender: 'Female')
angela.bio = "Love to party, love going on adventures. Also Netflix and Chill."
pam = User.create(email: "pamvasquez@gmail.com", password: "123456", name: "Pam Vasquez", age: 23, location: 'London', gender: 'Female')
pam.bio = "I love roller coasters but the pirate ship ride completely terrifies me. I once backpacked around Lake Tahoe in 13 days. When I was 14 I got a concussion swing dancing."
caro = User.create(email: "carohilton@gmail.com", password: "123456", name: "Caro Hilton", age: 25, location: 'London', gender: 'Female')
caro.bio = "About Me: I like to sing-talk, guys with messy hair, reading the New Yorker on Sunday mornings, and funny voices. About You: If you’re still reading, that’s pretty good. Let’s do this."
sara = User.create(email: "sarahenderson@gmail.com", password: "123456", name: "Sara Henderson", age: 27, location: 'London', gender: 'Female')
sara.bio = "All happy girls are alike; every unhappy girl is unhappy in her own way. My kind of unhappy is full of self-deprecating humor, double IPAs, and is actually pretty rad. Let me know if you want to be miserable together."
marie = User.create(email: "mariecuvander@gmail.com", password: "123456", name: "Marie Cuvander", age: 21, location: 'London', gender: 'Female')
marie.bio = "I live my whole life setting up situations that will eventually lead to the phrase, “And then laughter and hilarity ensued…” Hoping this one will work out too."

puts "Creating user photos"

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

puts "Creating bar photos"

def create_bar_photos(bar, bar_list)
  bar_list = []
  3.times.each_with_index do |idx|
    photo_list << "https://res.cloudinary.com/dcteumtl0/image/upload/v1551190991/skal/users/#{bar_list}/#{idx+1}.jpg"
  end
  bar_list.each do |photo_url|
    photo = Photo.new(bar: bar)
    photo.remote_photo_url = photo_url
    photo.save
  end
end

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

# create_bar_photos()

