class SeasonStormsController < ApplicationController
  def index
    @season = Season.find(params[:id])
    @storms = @season.storms
  end
end