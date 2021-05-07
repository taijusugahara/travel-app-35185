FactoryBot.define do
  factory :plane do
    name { '飛行機A' }
    price { 20_000 }
    howmany { 3 }
    go_date { '2021/9/1' }
    back_date { '2021/9/7' }
    go_time { '03:00' }
    back_time { '09:00' }
    association :user
    association :country
  end
end
