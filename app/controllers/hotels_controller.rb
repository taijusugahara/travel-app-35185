class HotelsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    @country = Country.find(params[:country_id])
    @hotel = Hotel.new
    @thai = ThaiHotel.all
    @cambo = CamboHotel.all
    @vet = VetHotel.all
  end

  def create
    @country = Country.find(params[:country_id])
    @hotel = Hotel.new(plane_params)
    
    if @hotel.save
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiHotel.all
      @cambo = CamboHotel.all
      @vet = VetHotel.all
      render :new

    end
  end

  private
  def plane_params
    params.require(:hotel).permit(:name, :price, :day, :go_date, :back_date).merge(user_id: current_user.id, country_id: params[:country_id])
  end


end
