class CountriesController < ApplicationController
  def index
  end

  def new
    @country = Country.new
  end

  def create
    
    @country = Country.new(country_params)
    
    if @country.save
     redirect_to root_path
  
      
    else
      render :new
    end
  end



  private
  def country_params
  
  params.require(:country).permit(:name).merge(user_id: current_user.id)
  end
end
