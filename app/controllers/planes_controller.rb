class PlanesController < ApplicationController
  before_action :authenticate_user!
  def index
    @country = Country.find(params[:country_id])
  end
  

end
