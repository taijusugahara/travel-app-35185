class OrdersController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    @order= OrderInfo.new
  end

  def create
    
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    
    # binding.pry
    if @country.plane && @country.hotel
      @order = OrderInfo.new(order_params_c)
      if @order.valid?
         @order.save
        
        redirect_to root_path
      else
        render :index
      end
    
    elsif @country.plane
      @order = OrderInfo.new(order_params_a)
     
      if @order.valid?
        @order.save
        
        redirect_to root_path
      else
        render :index
      end
    

    elsif @country.hotel
      @order = OrderInfo.new(order_params_b)
      if @order.valid?
        @order.save
        
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
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id)
  end

  def order_params_b
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, hotel_id: @hotel.id)
  end

  def order_params_c
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id, hotel_id: @hotel.id)
  end

end
