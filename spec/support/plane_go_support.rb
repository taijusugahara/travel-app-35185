module PlaneGoSupport
  def plane_go_support
    select '飛行機A', from: 'plane_go[name]'
    select '15000', from: 'plane_go[price]'
    fill_in 'plane_go[howmany]', with: 4
    select '2021', from: 'plane_go[go_date(1i)]'
    select '9', from: 'plane_go[go_date(2i)]'
    select '20', from: 'plane_go[go_date(3i)]'
    select '03:00', from: 'plane_go[go_time]'
  end
end
