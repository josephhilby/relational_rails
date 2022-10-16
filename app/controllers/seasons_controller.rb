class SeasonsController < ApplicationController
  def index
    seasons = Season.all
    @seasons = seasons.order(params[:sort])
  end

  def new
  end

  def create
    if params[:season][:fema_state_emg] == 'true'
      fema_state_emg = true
    else
      fema_state_emg = false
    end
    season = Season.new({
      year: params[:season][:year].to_i,
      biggest_storm: params[:season][:biggest_storm],
      fema_state_emg: fema_state_emg
    })
    season.save
    redirect_to '/seasons'
  end

  def show
    @season = Season.find(params[:id])
    @id = params[:id]
    @storms = @season.storms_counter
  end

  def edit
    @season = Season.find(params[:id])
  end

  def update
    if params[:season][:fema_state_emg] == 'true'
      fema_state_emg = true
    else
      fema_state_emg = false
    end
    season = Season.find(params[:id])
    season.update({
      year: params[:season][:year].to_i,
      biggest_storm: params[:season][:biggest_storm],
      fema_state_emg: fema_state_emg
    })
    season.save
    redirect_to "/seasons/#{season.id}"
  end

  def destroy
    Storm.where(season_id: params[:id]).destroy_all
    Season.destroy(params[:id])
    redirect_to '/seasons'
  end
end