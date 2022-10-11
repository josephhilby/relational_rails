class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def new
  end

  def create
    if params[:season][:fema_state_emg] == true
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
end