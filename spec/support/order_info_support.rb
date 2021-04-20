module OrderInfoSupport
  def order_info_support
    fill_in 'order_info[number]', with: '4012888888881881'
      fill_in 'order_info[month]', with: '12'
      fill_in 'order_info[year]', with: '23'
      fill_in 'order_info[cvc]', with: '123'
      fill_in 'order_info[passport_number]', with: '1234ABCDE'
      fill_in 'order_info[first_name]', with: 'YAMA'
      fill_in 'order_info[last_name]', with: 'TARO'
      fill_in 'order_info[nationality]', with: 'JAPAN'
      select '2000', from: 'order_info[birthday(1i)]'
      select '12', from: 'order_info[birthday(2i)]'
      select '24', from: 'order_info[birthday(3i)]'
      select '男', from: 'order_info[gender]'
      fill_in 'order_info[registered_place]', with: 'OSAKA'
      select '2014', from: 'order_info[issue_date(1i)]'
      select '12', from: 'order_info[issue_date(2i)]'
      select '24', from: 'order_info[issue_date(3i)]'
      select '2025', from: 'order_info[expiry_date(1i)]'
      select '12', from: 'order_info[expiry_date(2i)]'
      select '24', from: 'order_info[expiry_date(3i)]'


  end
end