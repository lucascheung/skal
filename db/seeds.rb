Swipe.destroy_all
User.destroy_all
Match.destroy_all

puts "Creating Users"
bob = User.create(email: "bob@gmail.com", password: "123456")
mary = User.create(email: "mary@gmail.com", password: "123456")
susan = User.create(email: "susan@gmail.com", password: "123456")
sue = User.create(email: "sue@gmail.com", password: "123456")
gillian = User.create(email: "gillian@gmail.com", password: "123456")
carol = User.create(email: "carol@gmail.com", password: "123456")
puts "Done with users"
chicks = [mary, susan, sue, gillian, carol]

puts 'Swipe'
chicks.each do |chick|
  Swipe.create(swiper: bob, swipee: chick, like: [true, false].sample)
  Swipe.create(swiper: chick, swipee: bob, like: [true, false].sample)
  puts "Created swipe"
end

puts 'bar'
bar = Bar.create!(name:'dirty dicks', description:'yooooo', location:'london')

puts 'coupon'
coupon = Coupon.create!(used:false)

puts 'meet up time'
meet = MeetUpTime.create(first_user_accepted:false, last_user_accepted:false)



puts 'match'
Match.create!(first_user: bob, last_user:sue, bar:bar, coupon:coupon, meet_up_time:meet)
puts 'done match'

