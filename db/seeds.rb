Swipe.destroy_all
User.destroy_all
Match.destroy_all

puts "Creating male users"
anders = User.create(email: "andersthorson@gmail.com", password: "123456", name: "Anders Thorson", age: 23, location: 'London', bio: '', remote_photo_url: "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png")
christian = User.create(email: "christiandaley@gmail.com", password: "123456", name: "Christian Daley", age: 21, location: 'London', bio: '', photos: [])
tom = User.create(email: "tomfrey@gmail.com", password: "123456", name: "Tom Frey", age: 20, location: 'London', bio: '', photos: [])
matt = User.create(email: "matthansen@gmail.com", password: "123456", name: "Matt Hansen", age: 28, location: 'London', bio: '', photos: [])
oliver = User.create(email: "oliverembacker@gmail.com", password: "123456", name: "Oliver Embacher", age: 19, location: 'London', bio: '', photos: [])

puts "Creating female users"
kristina = User.create(email: "kristinaivanova@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London', bio: '', photos: [])
kristina = User.create(email: "pam@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London', bio: '', photos: [])
kristina = User.create(email: "kristinaivanova@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London', bio: '', photos: [])
kristina = User.create(email: "kristinaivanova@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London', bio: '', photos: [])
kristina = User.create(email: "kristinaivanova@gmail.com", password: "123456", name: "Kristina Ivanova", age: 19, location: 'London', bio: '', photos: [])





#
#
# mary = User.create(email: "mary@gmail.com", password: "123456")
# susan = User.create(email: "susan@gmail.com", password: "123456")
# sue = User.create(email: "sue@gmail.com", password: "123456")
# gillian = User.create(email: "gillian@gmail.com", password: "123456")
# carol = User.create(email: "carol@gmail.com", password: "123456")
# puts "Done with users"
# chicks = [mary, susan, sue, gillian, carol]
#
# puts 'Swipe'
# chicks.each do |chick|
#   Swipe.create(swiper: bob, swipee: chick, like: [true, false].sample)
#   Swipe.create(swiper: chick, swipee: bob, like: [true, false].sample)
#   puts "Created swipe"
# end
#
# puts 'bar'
# bar = Bar.create!(name:'dirty dicks', description:'yooooo', location:'london')
#
# puts 'coupon'
# coupon = Coupon.create!(used:false)
#
# puts 'meet up time'
# meet = MeetUpTime.create(first_user_accepted:false, last_user_accepted:false)
#
#
#
# puts 'match'
# Match.create!(first_user: bob, last_user:sue, bar:bar, coupon:coupon, meet_up_time:meet)
# puts 'done match'
#
#
# #############
#
#
# require 'faker'
#
# Swipe.destroy_all
# User.destroy_all
#
#
# ## User creations
# puts "Creating Users"
# bob = User.create(email: "bob@gmail.com", password: "123456")
# mary = User.create(email: "mary@gmail.com", password: "123456")
# susan = User.create(email: "susan@gmail.com", password: "123456")
# sue = User.create(email: "sue@gmail.com", password: "123456")
# gillian = User.create(email: "gillian@gmail.com", password: "123456")
# carol = User.create(email: "carol@gmail.com", password: "123456")
#
# chicks = [mary, susan, sue, gillian, carol]

# 10.times.each_with_index do |idx|
#   name = Faker::Name.name
#   email = "#{name.gsub(' ', '')}@gmail.com"
#   gender = ["Female", "Male"].sample
#   age = rand(18...28)
#   password = 100000
#   image = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550763608/hotgirl#{idx+1}.jpg"
#   new_user = User.new(name:name, email:email, password:password, age:age, gender:gender, image:image)
#   new_user.save!
# end

## Swipe creations
#
# puts "Creating swipes"
# chicks.each do |chick|
#   Swipe.create(swiper: bob, swipee: chick, like: [true, false].sample)
# end
#
# chicks.each do |chick|
#   Swipe.create(swiper: mary, swipee: chick, like: [true, false].sample) if chick != mary
# end
#
# chicks.each do |chick|
#   Swipe.create(swiper: susan, swipee: chick, like: [true, false].sample) if chick != susan
# end
#
# puts "Creating bars"
#
# dirty = Bar.create(name: 'Dirty Dicks', location: '202 Bishopsgate, London EC2M 4NR, UK', description: '3-floor pub with wood panelling, named after notoriously dirty, local 18th-century warehouse.')
# purl = Bar.create(name: 'Purl London', location: '50-54 Blandford St, Marylebone, London W1U 7HX, UK', description: 'Inventively designed multi-sensory cocktails served in a brick-lined, 19th-century cellar bar.')
# boston = Bar.create(name: '68 and Boston', location: '5 Greek St, Soho, London W1D 4DD, UK', description: 'Split-level wine and cocktail bar with refined wood panelling, banquettes and designer lighting.')
# nightjar = Bar.create(name: 'Nightjar', location: '129 City Rd, Hoxton, London EC1V 1JB, UK', description: 'Nightjar')

# puts "Creating coupons"
#
# 3.times.each do
#   Coupon.create(used: false, expiry_date: Time.now + (2*7*24*60*60))
# end
#
#
# puts "Creating meet up times"
#
# puts "Creating matches"
#
# matches.each do |chick|
#   Match.create(first_user: , last_user: , bar_id: , like: [true, false].sample)
#   puts "Created swipe"
# end
