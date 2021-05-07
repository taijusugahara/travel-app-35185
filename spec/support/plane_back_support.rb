module PlaneBackSupport
  def plane_back_support
    select '飛行機A', from: 'plane_back[name]'
    select '18000', from: 'plane_back[price]'
    fill_in 'plane_back[howmany]', with: 4
    select '2021', from: 'plane_back[back_date(1i)]'
    select '9', from: 'plane_back[back_date(2i)]'
    select '20', from: 'plane_back[back_date(3i)]'
    select '03:00', from: 'plane_back[back_time]'
  end
end
