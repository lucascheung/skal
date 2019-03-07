class MatchesController < ApplicationController
  def index
    @matches = Match.where(first_user: current_user).or(Match.where(last_user: current_user))
  end

  def show
    @match = Match.find(params[:id])
    @your_date = @match.first_user == current_user ? @match.last_user : @match.first_user
    @bar = @match.bar
    # @markers =
    #   [{
    #     lng: @bar.longitude,
    #     lat: @bar.latitude
    #   }]
  end
end

