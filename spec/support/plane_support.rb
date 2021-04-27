module PlaneSupport
  def plane_support
    select '飛行機A', from: "plane[name]"
      select '20000', from: "plane[price]"
      fill_in 'plane[howmany]', with: 4
      select '2021', from: 'plane[go_date(1i)]'
      select '9', from: 'plane[go_date(2i)]'
      select '20', from: 'plane[go_date(3i)]'
      select '2021', from: 'plane[back_date(1i)]'
      select '9', from: 'plane[back_date(2i)]'
      select '30', from: 'plane[back_date(3i)]'
      select '03:00', from: 'plane[go_time]'
      select '09:00', from: 'plane[back_time]'
  end
end