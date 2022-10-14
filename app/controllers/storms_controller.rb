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
      landfall: landfall
    })
    season.save
    redirect_to '/storms'
  end

  def show
    @storm = Storm.find(params[:id])
  end
end