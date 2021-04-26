class PlaneBacksController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def new

  end

  def create

  end

end
