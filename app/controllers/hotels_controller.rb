class HotelsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    
    @country = Country.find(params[:country_id])
    # redirect_to new_country_hotel_path(@country.id)
    @hotel = Hotel.new
    @thai = ThaiHotel.all
    @cambo = CamboHotel.all
    @vet = VetHotel.all
  end

  def create
    @country = Country.find(params[:country_id])
    @hotel = Hotel.new(hotel_params)
    
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

    def edit
      @country = Country.find(params[:country_id])
      @hotel = Hotel.find(params[:id])
      @thai = ThaiHotel.all
      @cambo = CamboHotel.all
      @vet = VetHotel.all
    end

    def update
      @country = Country.find(params[:country_id])
      @hotel = Hotel.find(params[:id])
      
      if @hotel.update(hotel_params)
        redirect_to country_path(@country.id)
      else
        @country = Country.find(params[:country_id])
        @thai = ThaiHotel.all
        @cambo = CamboHotel.all
        @vet = VetHotel.all
        render :edit
      end
    end

    def destroy
      @country = Country.find(params[:country_id])
      @hotel = Hotel.find(params[:id])
      @hotel.destroy
      redirect_to country_path(@country.id)
    end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :price, :day, :go_date, :back_date).merge(user_id: current_user.id, country_id: params[:country_id])
  end


end
