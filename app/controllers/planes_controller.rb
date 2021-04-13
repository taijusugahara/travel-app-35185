class PlanesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end
  

end
