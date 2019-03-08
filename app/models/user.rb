class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :swipes, foreign_key: "swiper_id", class_name: "Swipe"
  has_many :first_matches, foreign_key: "first_user_id", class_name: "Match"
  has_many :last_matches, foreign_key: "last_user_id", class_name: "Match"


  has_many :photos

  def matches
    first_matches + last_matches
  end

  def self.age_calculate(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.first_name
      user.gender = auth.extra.raw_info.gender
      user.image = auth.info.image
      user.age = age_calculate(Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')) # assuming the user model has an image
      user.preference = user.gender == 'male' ? 'female' : 'male'
      user.save
      propic_id = auth.extra.raw_info.albums['data'].find { |album| album['name'] == "Profile Pictures" }['id']
      album_url = "https://graph.facebook.com/v2.10/#{propic_id}/photos?access_token=#{auth.credentials.token}"
      user_serialized = open(album_url).read
      profile_data= JSON.parse(user_serialized)
      profile_data['data'].first(5).each do |image|
        url = "https://graph.facebook.com/v2.10/#{image['id']}/picture?access_token=#{auth.credentials.token}&width=600"
        photo = Photo.new(user: user)
        photo.remote_photo_url = url
        photo.save
      end
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end


