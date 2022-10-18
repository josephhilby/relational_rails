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
    if params[:landfall] == 'Yes'
      landfall = true
    else
      landfall = false
    end
    season = Storm.new({
      storm_type: params[:storm_type],
      landfall: landfall,
      wind_spd: params[:wind_spd].to_i,
      name: params[:name],
      season_id: params[:id]
    })
    season.save
    redirect_to "/seasons/#{params[:id]}/storms"
  end
end