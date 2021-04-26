class ToursController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    
    @country = Country.find(params[:country_id])

  end
end
