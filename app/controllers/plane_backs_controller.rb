class PlaneBacksController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    @country = Country.find(params[:country_id])
    @plane = PlaneBack.new
    @thai = ThaiPlaneBack.all
    @cambo = CamboPlaneBack.all
    @vet = VetPlaneBack.all
    @malaysia = MalaysiaPlaneBack.all
    @singapore = SingaporePlaneBack.all
  end

  def create
    @country = Country.find(params[:country_id])
    @plane = PlaneBack.new(plane_params)
    
    if @plane.save
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiPlaneBack.all
      @cambo = CamboPlaneBack.all
      @vet = VetPlaneBack.all
      @malaysia = MalaysiaPlaneBack.all
      @singapore = SingaporePlaneBack.all
      render :new
    end
  end

  def edit
    @country = Country.find(params[:country_id])
    @plane = PlaneBack.find(params[:id])
    @thai = ThaiPlaneBack.all
    @cambo = CamboPlaneBack.all
    @vet = VetPlaneBack.all
    @malaysia = MalaysiaPlaneBack.all
    @singapore = SingaporePlaneBack.all
  end

  def update
    @country = Country.find(params[:country_id])
    @plane = PlaneBack.find(params[:id])
    if @plane.update(plane_params)
      redirect_to country_path(@country.id)
    else
      @country = Country.find(params[:country_id])
      @thai = ThaiPlaneBack.all
      @cambo = CamboPlaneBack.all
      @vet = VetPlaneBack.all
      @malaysia = MalaysiaPlaneBack.all
      @singapore = SingaporePlaneBack.all
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:country_id])
    @plane = PlaneBack.find(params[:id])
    @plane.destroy
    redirect_to country_path(@country.id)
  end

  private
  def plane_params
    params.require(:plane_back).permit(:name, :price, :howmany, :back_date, :back_time).merge(user_id: current_user.id, country_id: params[:country_id])
  end

  def move_to_root
    @country = Country.find(params[:country_id])
    redirect_to root_path if current_user.id != @country.user.id 
  end

end
