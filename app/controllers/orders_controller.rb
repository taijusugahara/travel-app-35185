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
    
    
    if @country.plane && @country.hotel
      @order = OrderInfo.new(order_params_c)
      if @order.valid?
        pay_order_c
         @order.save
        
        redirect_to root_path
      else
        render :index
      end
    
    elsif @country.plane
      @order = OrderInfo.new(order_params_a)
      if @order.valid?
        pay_order_a
        @order.save
        
        redirect_to root_path
      else
        render :index
      end
    

    elsif @country.hotel
      @order = OrderInfo.new(order_params_b)
      if @order.valid?
        pay_order_b
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
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id,token: params[:token])
  end

  def order_params_b
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, hotel_id: @hotel.id,token: params[:token])
  end

  def order_params_c
    params.require(:order_info).permit(:passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date).merge(user_id: current_user.id, country_id: @country.id, plane_id: @plane.id, hotel_id: @hotel.id,token: params[:token])
  end

  def pay_order_a
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane.price,
      card: order_params_a[:token],
      currency: 'jpy'
    )
  end

  def pay_order_b
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @hotel.price * @hotel.day,
      card: order_params_b[:token],
      currency: 'jpy'
    )
  end

  def pay_order_c
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane.price + @hotel.price * @hotel.day,
      card: order_params_c[:token],
      currency: 'jpy'
    )
  end
end
