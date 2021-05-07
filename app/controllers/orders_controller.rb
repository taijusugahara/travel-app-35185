class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :move_to_country
  def index
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @plane_go = PlaneGo.find_by(country_id: @country.id)
    @plane_back = PlaneBack.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    @tour = Tour.find_by(country_id: @country.id)
    @order = OrderInfo.new
  end

  def create
    @country = Country.find(params[:country_id])
    @plane = Plane.find_by(country_id: @country.id)
    @plane_go = PlaneGo.find_by(country_id: @country.id)
    @plane_back = PlaneBack.find_by(country_id: @country.id)
    @hotel = Hotel.find_by(country_id: @country.id)
    @tour = Tour.find_by(country_id: @country.id)

    # メール用
    country = Country.find(params[:country_id])
    plane = Plane.find_by(country_id: country.id)
    plane_go = PlaneGo.find_by(country_id: country.id)
    plane_back = PlaneBack.find_by(country_id: country.id)
    hotel = Hotel.find_by(country_id: country.id)
    tour = Tour.find_by(country_id: country.id)
    # user = current_user
    if @country.tour
      @order = OrderInfo.new(order_params_j)
      if @order.valid?
        pay_order_j
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end
    elsif @country.plane && @country.hotel
      @order = OrderInfo.new(order_params_c)
      if @order.valid?
        pay_order_c
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane
      @order = OrderInfo.new(order_params_a)
      if @order.valid?
        pay_order_a
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_go && @country.plane_back && @country.hotel
      @order = OrderInfo.new(order_params_i)
      if @order.valid?
        pay_order_i
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_go && @country.hotel
      @order = OrderInfo.new(order_params_e)
      if @order.valid?
        pay_order_e
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_back && @country.hotel
      @order = OrderInfo.new(order_params_g)
      if @order.valid?
        pay_order_g
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_go && @country.plane_back
      @order = OrderInfo.new(order_params_h)
      if @order.valid?
        pay_order_h
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.hotel
      @order = OrderInfo.new(order_params_b)
      if @order.valid?
        pay_order_b
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_go
      @order = OrderInfo.new(order_params_d)
      if @order.valid?
        pay_order_d
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
        redirect_to root_path
      else
        render :index
      end

    elsif @country.plane_back
      @order = OrderInfo.new(order_params_f)
      if @order.valid?
        pay_order_f
        @order.save
        OrderMailer.send_when_admin_reply(country, plane, plane_go, plane_back, hotel, tour).deliver # 確認メールを送信
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
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_id: @plane.id, token: params[:token])
  end

  def order_params_b
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, hotel_id: @hotel.id, token: params[:token])
  end

  def order_params_c
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_id: @plane.id, hotel_id: @hotel.id, token: params[:token])
  end

  def order_params_d
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_go_id: @plane_go.id, token: params[:token])
  end

  def order_params_e
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_go_id: @plane_go.id, hotel_id: @hotel.id, token: params[:token])
  end

  def order_params_f
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_back_id: @plane_back.id, token: params[:token])
  end

  def order_params_g
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_back_id: @plane_back.id, hotel_id: @hotel.id, token: params[:token])
  end

  def order_params_h
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_go_id: @plane_go.id, plane_back_id: @plane_back.id, token: params[:token])
  end

  def order_params_i
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, plane_go_id: @plane_go.id, plane_back_id: @plane_back.id, hotel_id: @hotel.id, token: params[:token])
  end

  def order_params_j
    params.require(:order_info).permit(:passport_number, :first_name, :last_name).merge(user_id: current_user.id,
                                                                                        country_id: @country.id, tour_id: @tour.id, token: params[:token])
  end

  def pay_order_a
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane.price * @plane.howmany,
      card: order_params_a[:token],
      currency: 'jpy'
    )
  end

  def pay_order_b
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @hotel.price * @hotel.day * @hotel.howmany,
      card: order_params_b[:token],
      currency: 'jpy'
    )
  end

  def pay_order_c
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane.price * @plane.howmany + @hotel.price * @hotel.day * @hotel.howmany,
      card: order_params_c[:token],
      currency: 'jpy'
    )
  end

  def pay_order_d
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_go.price * @plane_go.howmany,
      card: order_params_d[:token],
      currency: 'jpy'
    )
  end

  def pay_order_e
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_go.price * @plane_go.howmany + @hotel.price * @hotel.day * @hotel.howmany,
      card: order_params_e[:token],
      currency: 'jpy'
    )
  end

  def pay_order_f
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_back.price * @plane_back.howmany,
      card: order_params_f[:token],
      currency: 'jpy'
    )
  end

  def pay_order_g
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_back.price * @plane_back.howmany + @hotel.price * @hotel.day * @hotel.howmany,
      card: order_params_g[:token],
      currency: 'jpy'
    )
  end

  def pay_order_h
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_go.price * @plane_go.howmany + @plane_back.price * @plane_back.howmany,
      card: order_params_h[:token],
      currency: 'jpy'
    )
  end

  def pay_order_i
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @plane_go.price * @plane_go.howmany + @plane_back.price * @plane_back.howmany + @hotel.price * @hotel.day * @hotel.howmany,
      card: order_params_i[:token],
      currency: 'jpy'
    )
  end

  def pay_order_j
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @tour.price * @tour.howmany,
      card: order_params_j[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    @country = Country.find(params[:country_id])
    redirect_to root_path if current_user.id != @country.user.id
  end

  def move_to_country
    @country = Country.find(params[:country_id])
    if !@country.plane && !@country.plane_go && (!@country.plane_back && !@country.hotel) && !@country.tour
      redirect_to country_path(@country.id)
    end
  end
end
