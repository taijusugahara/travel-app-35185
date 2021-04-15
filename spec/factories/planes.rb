FactoryBot.define do
  factory :plane do
    country_plane_id {1}
    go_date {'2021/6/1'}
    back_date{'2021/6/7'}
    association :user
    association :country

    
  end
end
