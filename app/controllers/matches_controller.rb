class MatchesController < ApplicationController
  def index
    @matches = Match.where(first_user == current_user || last_user == current_user)
  end

  def show
    @match = Match.find(params[:id])
  end
end
