require 'csv'

Swipe.destroy_all
User.destroy_all
Coupon.destroy_all
Bar.destroy_all
MeetUpTime.destroy_all
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


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach('db/bars.csv', csv_options) do |row|
  Bar.create!(name:row['name'], location:row['location'], description:row['description'])
end
