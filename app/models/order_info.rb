class OrderInfo
  
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :user_id, :country_id, :plane_id, :plane_go_id, :plane_back_id, :hotel_id, :tour_id, :passport_number, :first_name, :last_name, :nationality, :birthday, :gender, :registered_place, :issue_date, :expiry_date, :token

  with_options presence: true do
    validates :user_id, :country_id, :birthday,  :gender, :issue_date,  :expiry_date, :token
    with_options format:{with: /\A[A-Z]+\z/} do
      validates :first_name, :last_name, :nationality, :registered_place
    end
    with_options format:{with: /(?=.*[A-Z])(?=.*\d)/} do
      validates :passport_number
    end

    
  end

  # validates_date :issue_date, :on => :create, :on_or_after => :today 

  

  def save
    order = Order.create(user_id: user_id, country_id: country_id, plane_id: plane_id, plane_go_id: plane_go_id, plane_back_id: plane_back_id, hotel_id: hotel_id, tour_id: tour_id)
    Info.create(passport_number: passport_number, first_name: first_name, last_name: last_name, nationality: nationality, birthday: birthday, gender: gender, registered_place: registered_place, issue_date: issue_date, expiry_date: expiry_date, order_id: order.id)
                 
  end
end