class OrdersController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    @ordr= Order.new
  end

  def create
    
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    
    # binding.pry
    if @country.plane && @country.hotel
      @order = Order.new(order_params_c)
      if @order.save!
        
        redirect_to root_path
      else
        render :index
      end
    
    elsif @country.plane
      @order = Order.new(order_params_a)
      if @order.save!
        
        redirect_to root_path
      else
        render :index
      end
    

    elsif @country.hotel
      @order = Order.new(order_params_b)
      if @order.save!
        
        redirect_to root_path
      else
        render :index
      end
    

    
    else
    # unless @country.plane || @country.hotel

      redirect_to country_path(@country.id)
    end
  end

    

  private
  def order_params_a
    params.permit().merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id)
  end

  def order_params_b
    params.permit().merge(user_id: current_user.id, country_id: @country.id, hotel_id: @hotel.id)
  end

  def order_params_c
    params.permit().merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id, hotel_id: @hotel.id)
  end

end
