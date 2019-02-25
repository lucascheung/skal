Swipe.destroy_all
User.destroy_all

puts "Creating Users"
bob = User.create(email: "bob@gmail.com", password: "123456")
mary = User.create(email: "mary@gmail.com", password: "123456")
susan = User.create(email: "susan@gmail.com", password: "123456")
sue = User.create(email: "sue@gmail.com", password: "123456")
gillian = User.create(email: "gillian@gmail.com", password: "123456")
carol = User.create(email: "carol@gmail.com", password: "123456")
puts "Done with users"
chicks = [mary, susan, sue, gillian, carol]

chicks.each do |chick|
  Swipe.create(swiper: bob, swipee: chick, like: [true, false].sample)
  puts "Created swipe"
end
