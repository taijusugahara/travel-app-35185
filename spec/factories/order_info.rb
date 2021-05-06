FactoryBot.define do
  factory :order_info do
    passport_number {'1234ABCD'}
    first_name {"YAMADA"}
    last_name {"TAROU"}
    
    token{"tok_abcdefghijk"}
  end
end