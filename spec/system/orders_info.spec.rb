require 'rails_helper'
RSpec.describe "飛行機とホテル購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機とホテル購入'do
      it '飛行機とホテルを選択しているユーザーは飛行機とホテルを購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機を選ぶ')
      # 飛行機一覧ページにいく
      visit country_planes_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_path(@country)
      # 情報を入力する
      select '飛行機A', from: "plane[name]"
      select '20000', from: "plane[price]"
      select '2021', from: 'plane[go_date(1i)]'
      select '9', from: 'plane[go_date(2i)]'
      select '20', from: 'plane[go_date(3i)]'
      select '2021', from: 'plane[back_date(1i)]'
      select '9', from: 'plane[back_date(2i)]'
      select '30', from: 'plane[back_date(3i)]'
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { Plane.count }.by(1)
        # 国詳細ページへと移動する
        expect(current_path).to eq (country_path(@country.id))
     
        # ホテルを選択する！！！！！

        # ホテルを選ぶリンクがある
      expect(page).to have_content ('ホテルを選ぶ')
      # ホテルを選ぶリンクにいく
      visit country_hotels_path(@country)
      # ホテルを予約するリンクがある
      expect(page).to have_content ('ホテルを予約する')
      # ホテルを予約するリンク＝ホテル選択ページにいく
      visit new_country_hotel_path(@country)
      # 情報を入力する
      select 'ホテルあいうえお', from: "hotel[name]"
      select '3000', from: "hotel[price]"
      fill_in 'hotel[day]', with: '2'
      select '2021', from: 'hotel[go_date(1i)]'
      select '8', from: 'hotel[go_date(2i)]'
      select '20', from: 'hotel[go_date(3i)]'
      select '2021', from: 'hotel[back_date(1i)]'
      select '8', from: 'hotel[back_date(2i)]'
      select '22', from: 'hotel[back_date(3i)]'
      # 送信するとHotelモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { Hotel.count }.by(1)
        # 国詳細ページへと移動する
        expect(current_path).to eq (country_path(@country.id))
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@country)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_content("選択した飛行機情報")
      expect(page).to have_content("選択したホテル情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
        find('input[name="commit"]').click
        sleep 2
      }.to change { Order.count & Info.count }.by(1)
      
        # トップページへと移行する
        expect(current_path).to eq (root_path)

        
    end
  end

end

RSpec.describe "飛行機のみ購入", type: :system do
  before do
      
      @plane = FactoryBot.create(:plane)
     
   
  end

  context '飛行機購入'do
      it '飛行機を選択しているユーザーは飛行機を購入できる'do
      # ログインする
      sign_in(@plane.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane.country)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@plane.country)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_content("選択した飛行機情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
      find('input[name="commit"]').click
      sleep 2
      }.to change { Order.count & Info.count }.by(1)
      # トップページへと移行する
      expect(current_path).to eq (root_path)
    end
  end
end

RSpec.describe "ホテルのみ購入", type: :system do
  before do
      
      @hotel = FactoryBot.create(:hotel)
     
   
  end

  context 'ホテル購入'do
      it 'ホテルを選択しているユーザーはホテルを購入できる'do
      # ログインする
      sign_in(@hotel.country.user)
      # 国詳細ページを訪れる
      visit country_path(@hotel.country)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@hotel.country)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_content("選択したホテル情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
      find('input[name="commit"]').click
      sleep 2
      }.to change { Order.count & Info.count }.by(1)
      # トップページへと移行する
      expect(current_path).to eq (root_path)
    end
  end
end

RSpec.describe "購入できない場合", type: :system do
  before do
      
      @country1 = FactoryBot.create(:country)
      @country2 = FactoryBot.create(:country)
     
   
  end

  context '購入できない'do
      it '飛行機、ホテルどちらも選択していない場合は購入できない'do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@country1)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_no_content("選択した飛行機情報")
      expect(page).to have_no_content("選択したホテル情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
      find('input[name="commit"]').click
      sleep 2
      }.to change { Order.count & Info.count }.by(0)
      # 国詳細ページへと戻される
      expect(current_path).to eq (country_path(@country1))

    end
    it 'ログインしているユーザーは他者の購入ページにいくことはできない' do
      sign_in(@country1.user)
      visit country_orders_path(@country2)
      expect(current_path).to eq (root_path)
    end

    it 'ログインしていないユーザーは購入ページにいくことはできない' do
      visit root_path
      visit country_orders_path(@country1)
      expect(current_path).to eq (new_user_session_path)
    end
  end
end

