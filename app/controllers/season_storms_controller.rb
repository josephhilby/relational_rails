class SeasonStormsController < ApplicationController
  def index
    @season = Season.find(params[:id])
    @storms = @season.storms
  end

  def new
    @seasons = Season.all
  end

  def create
    if params[:storm][:landfall] == true
      landfall = true
    else
      landfall = false
    end
    season = Storm.new({
      year: params[:storm][:name],
      wind_spd: params[:storm][:wind_spd],
      landfall: landfall,
      name: params[:storm][:name],
      season_id: params[:storm][:season_id]
    })
    season.save
    redirect_to '/seasons/:id/storms'
  end
end