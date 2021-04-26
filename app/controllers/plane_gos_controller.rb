class PlaneGosController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def new
    @country = Country.find(params[:country_id])
    @plane = PlaneGo.new
    @thai = ThaiPlane.all
    @cambo = CamboPlane.all
    @vet = VetPlane.all
  end

  def create

  end
end
