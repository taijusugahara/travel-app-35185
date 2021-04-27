module HotelSupport
  def hotel_support
    select 'ホテルあいうえお', from: "hotel[name]"
      select '3000', from: "hotel[price]"
      fill_in 'hotel[howmany]', with: '4'
      fill_in 'hotel[day]', with: '2'
      select '2021', from: 'hotel[go_date(1i)]'
      select '8', from: 'hotel[go_date(2i)]'
      select '20', from: 'hotel[go_date(3i)]'
      select '2021', from: 'hotel[back_date(1i)]'
      select '8', from: 'hotel[back_date(2i)]'
      select '22', from: 'hotel[back_date(3i)]'
  end
end