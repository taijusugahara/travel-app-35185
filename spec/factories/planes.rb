FactoryBot.define do
  factory :plane do
    name {'飛行機A'}
    price {20000}
    go_date {'2021/9/1'}
    back_date{'2021/9/7'}
    association :user
    association :country

    
  end
end
