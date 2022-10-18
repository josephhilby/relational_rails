class SeasonStormsController < ApplicationController
  def index
    @season = Season.find(params[:id])
    wind = params[:wind_spd].to_i
    if params[:filter] == 'true'
      @storms = @season.storms.order(params[:sort]).filter_by_wind_spd(wind)
    else
      @storms = @season.storms.order(params[:sort])
    end
  end

  def new
    @season = Season.find(params[:id])
  end

  def create
    if params[:storm][:landfall] == 'true'
      landfall = true
    else
      landfall = false
    end
    season = Storm.new({
      storm_type: params[:storm][:storm_type],
      landfall: landfall,
      wind_spd: params[:storm][:wind_spd].to_i,
      name: params[:storm][:name],
      season_id: params[:storm][:season_id]
    })
    season.save
    redirect_to "/seasons/#{params[:storm][:season_id]}/storms"
  end
end