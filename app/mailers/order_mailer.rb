class OrderMailer < ApplicationMailer
  def send_when_admin_reply(country,plane,plane_go,plane_back,hotel,tour) #メソッドに対して引数を設定
    @country = country
    @plane = plane
    @plane_go = plane_go
    @plane_back = plane_back
    @hotel = hotel
    @tour = tour
    mail to: @country.user.email, subject: '【TravelApp】 ご購入ありがとうございます'
  end

end
