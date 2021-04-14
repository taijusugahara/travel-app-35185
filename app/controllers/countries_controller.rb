class CountriesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :move_to_root, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @country = Country.new
  end

  def create
    
    @country = Country.new(country_params)
    if @country.save
     redirect_to country_path(@country.id)
  
      
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
      redirect_to country_path(@country.id)
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

    def move_to_root
      @country = Country.find(params[:id])
      redirect_to root_path if current_user.id != @country.user.id 
    end
end
