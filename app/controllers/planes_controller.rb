class PlanesController < ApplicationController
  before_action :authenticate_user!
  def index
    @country = Country.find(params[:country_id])
    
  end

  def new
    @country = Country.find(params[:country_id])
    @plane = Plane.new
    @thai = ThaiPlane.all
    @cambo = CamboPlane.all
    @vet = VetPlane.all
  end

  def create
    @country = Country.find(params[:country_id])
    @plane = Plane.new(plane_params)
    
    if @plane.save
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiPlane.all
      @cambo = CamboPlane.all
      @vet = VetPlane.all
      render :new

    end
    
  end
  

  private
  def plane_params
    params.require(:plane).permit(:country_plane_id, :go_date, :back_date).merge(user_id: current_user.id, country_id: params[:country_id])
  end

end
