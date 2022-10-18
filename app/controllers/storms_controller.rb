class StormsController < ApplicationController
  def index
    @storms = Storm.where(landfall: true).reverse
  end

  def show
    @storm = Storm.find(params[:id])
  end

  def edit
    @seasons = Season.all
    @storm = Storm.find(params[:id])
  end

  def update
    if params[:landfall] == 'Yes'
      landfall = true
    else
      landfall = false
    end
    season = Season.find_by(year: params[:year])
    storm = Storm.find(params[:id])
    storm.update({
      storm_type: params[:storm_type],
      landfall: landfall,
      wind_spd: params[:wind_spd].to_i,
      name: params[:name],
      season_id: season[:id]
    })
    storm.save

    redirect_to "/storms/#{params[:id]}"
  end

  def destroy
    Storm.destroy(params[:id])
    redirect_to '/storms'
  end
end