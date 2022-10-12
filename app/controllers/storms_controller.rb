class StormsController < ApplicationController
  def index
    @storms = Storm.all
  end
end