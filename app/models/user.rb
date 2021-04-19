class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :countries
    has_many :planes
    has_many :hotels
    has_many :orders
  
  with_options presence: true do
    validates :nickname
    with_options format: { with: /[^ -~｡-ﾟ]+/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /[\p{katakana}　ー－]+/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  end
 


end
