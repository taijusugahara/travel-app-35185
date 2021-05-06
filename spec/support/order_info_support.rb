module OrderInfoSupport
  def order_info_support
    fill_in 'order_info[number]', with: '4012888888881881'
      fill_in 'order_info[month]', with: '12'
      fill_in 'order_info[year]', with: '23'
      fill_in 'order_info[cvc]', with: '123'
      fill_in 'order_info[passport_number]', with: '1234ABCDE'
      fill_in 'order_info[first_name]', with: 'YAMA'
      fill_in 'order_info[last_name]', with: 'TARO'
   


  end
end