require 'csv'

Match.destroy_all
Coupon.destroy_all
Bar.destroy_all
MeetUpTime.destroy_all
Swipe.destroy_all
User.destroy_all

def create_user_photos(user, url)
  5.times.each_with_index do |idx|
    photo_url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1551190991/skal/users/#{url}#{idx+1}.jpg"
    photo = Photo.new(user: user)
    photo.remote_photo_url = photo_url
    photo.save!
  end
end

def create_bar_photos(bar, url)
  3.times.each_with_index do |idx|
    photo_url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1551262327/skal/bars/#{url}_#{idx+1}.jpg"
    photo = Photo.new(bar: bar)
    photo.remote_photo_url = photo_url
    photo.save!
  end
end

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

puts "Creating male users"
CSV.foreach('db/male_users.csv', csv_options) do |row|
  user = User.create!(email:row['email'],
               password:row['password'],
               name:row['name'],
               age:row['age'],
               location:row['location'],
               gender:row['gender'],
               bio:row['bio']
  )
  create_user_photos(user, row['name'].downcase)
end

puts "Creating female users"
CSV.foreach('db/female_users.csv', csv_options) do |row|
  user = User.create!(email:row['email'],
                      password:row['password'],
                      name:row['name'],
                      age:row['age'],
                      location:row['location'],
                      gender:row['gender'],
                      bio:row['bio']
  )
  create_user_photos(user, row['name'].downcase)
end

puts "Creating bars"
CSV.foreach('db/bars.csv', csv_options) do |row|
  bar = Bar.create!(name:row['name'], location:row['location'], description:row['description'])
  create_bar_photos(bar, row['url'])
end

# puts "Creating coupons"
# CSV.foreach('db/coupons.csv', csv_options) do |row|
#   Coupon.create!(used: row['used'], expiry_date: row['expiry_date'].to_datetime, content: row['content'])
# end
#

# puts "Creating meet up times"
# CSV.foreach('db/meet_up_times.csv', csv_options) do |row|
#   MeetUpTime.create!(
#       first_user_accepted: User.find_by_name(row['first_user_accepted']),
#       last_user_accepted: User.find_by_name(row['last_user_accepted']),
#       meet_up_time: row['meet_up_time'].to_datetime
#   )
# end

# puts "Creating matches"
# CSV.foreach('db/matches.csv', csv_options) do |row|
#   Match.create!(
#         first_user: User.find_by_name(row['first_user']),
#         last_user: User.find_by_name(row['last_user']),
#         bar: Bar.find_by_name(row['bar']),
#         meet_up_time: MeetUpTime.all.sample,
#         coupon: Coupon.all.sample
#   )
# end
