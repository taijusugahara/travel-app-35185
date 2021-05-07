class CountriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_root, only: [:destroy, :show]
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
    @plane = Plane.find_by(country_id: @country.id)
    @plane_go = PlaneGo.find_by(country_id: @country.id)
    @plane_back = PlaneBack.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    @tour = Tour.find_by(country_id: @country.id)
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
