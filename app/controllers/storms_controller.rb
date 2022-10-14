class StormsController < ApplicationController
  def index
    @storms = Storm.all.reverse
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
    redirect_to '/storms'
  end

  def show
    @storm = Storm.find(params[:id])
  end

  def edit
    @seasons = Season.all
    @storm = Storm.find(params[:id])
  end

  def update
    storm = Storm.find(params[:id])
    if params[:storm][:landfall] == true
      landfall = true
    else
      landfall = false
    end
    storm.update({
      storm_type: params[:storm][:storm_type],
      landfall: landfall,
      wind_spd: params[:storm][:wind_spd],
      name: params[:storm][:name],
      season_id: params[:storm][:season_id]
    })
    storm.save
    redirect_to "/storms/#{storm.id}"
  end
end