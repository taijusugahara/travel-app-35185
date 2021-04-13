class CountriesController < ApplicationController
  def index
  end

  def new
    @country = Country.new
  end

  def create
    
    @country = Country.new(country_params)
    if @country.save
     redirect_to country_planes_path(@country.id)
  
      
    else
      render :new
    end
  end
  def show
    @country = Country.find(params[:id])
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
      @country.update(country_params)
      redirect_to country_planes_path(@country.id)
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to root_path
  end


  private
  def country_params
  
  params.require(:country).permit(:name).merge(user_id: current_user.id)
  end
end
