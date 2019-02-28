class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def settings
    @user = current_user
    @male_on = current_user.preference == 'male' ? 'on' : ''
    @female_on = current_user.preference == 'female' ? 'on' : ''
  end
end
