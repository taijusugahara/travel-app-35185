class ToursController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    
    @country = Country.find(params[:country_id])
    @tour = Tour.new
    @thai = ThaiTour.all
    @cambo = CamboTour.all
    @vet = VetTour.all
  end

  def create
    @country = Country.find(params[:country_id])
    @tour = Tour.new(tour_params)
    
    if @tour.save
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiTour.all
      @cambo = CamboTour.all
      @vet = VetTour.all
      render :new

    end
    
  end

  def edit
    @country = Country.find(params[:country_id])
    @tour = Tour.find(params[:id])
    @thai = ThaiTour.all
    @cambo = CamboTour.all
    @vet = VetTour.all
  end

  def update
    @country = Country.find(params[:country_id])
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiTour.all
      @cambo = CamboTour.all
      @vet = VetTour.all
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:country_id])
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to country_path(@country.id)
  end


  private

  def tour_params
    params.require(:tour).permit(:name, :price, :span, :howmany, :go_date).merge(user_id: current_user.id, country_id: params[:country_id])
  end

  def move_to_root
    @country = Country.find(params[:country_id])
    redirect_to root_path if current_user.id != @country.user.id 
  end


end
