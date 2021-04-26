class PlaneGosController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.new
    @thai = ThaiPlaneGo.all
    @cambo = CamboPlaneGo.all
    @vet = VetPlaneGo.all
  end

  def create
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.new(plane_params)
    
    if @plane.save
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiPlaneGo.all
      @cambo = CamboPlaneGo.all
      @vet = VetPlaneGo.all
      render :new
    end
  end

  def edit
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.find(params[:id])
    @thai = ThaiPlaneGo.all
    @cambo = CamboPlaneGo.all
    @vet = VetPlaneGo.all
  end

  def update
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.find(params[:id])
    if @plane.update(plane_params)
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiPlaneGo.all
      @cambo = CamboPlaneGo.all
      @vet = VetPlaneGo.all
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.find(params[:id])
    @plane.destroy
    redirect_to country_path(@country.id)
  end


  private
  def plane_params
    params.require(:plane_go).permit(:name, :price, :howmany, :go_date, :go_time).merge(user_id: current_user.id, country_id: params[:country_id])
  end

  def move_to_root
    @country = Country.find(params[:country_id])
    redirect_to root_path if current_user.id != @country.user.id 
  end

end
