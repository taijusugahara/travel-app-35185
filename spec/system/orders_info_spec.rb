require 'rails_helper'
RSpec.describe "飛行機とホテル購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機(往復)とホテル購入'do
      it '飛行機とホテルを選択しているユーザーは飛行機とホテルを購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(往復)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_planes_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(往復)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_path(@country)
      # 情報を入力する
      plane_support
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
      hotel_support
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
      expect(page).to have_content("選択した飛行機情報(往復)")
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

RSpec.describe "飛行機(往復)のみ購入", type: :system do
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
      expect(page).to have_content("選択した飛行機情報(往復)")
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

RSpec.describe "飛行機(行き)のみ購入", type: :system do
  before do
      
      @plane_go = FactoryBot.create(:plane_go)
     
   
  end

  context '飛行機購入'do
      it '飛行機を選択しているユーザーは飛行機を購入できる'do
      # ログインする
      sign_in(@plane_go.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane_go.country)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@plane_go.country)
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

RSpec.describe "飛行機(帰り)のみ購入", type: :system do
  before do
      
      @plane_back = FactoryBot.create(:plane_back)
     
   
  end

  context '飛行機(帰り)購入'do
      it '飛行機を選択しているユーザーは飛行機を購入できる'do
      # ログインする
      sign_in(@plane_back.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane_back.country)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@plane_back.country)
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

RSpec.describe "飛行機(行き)とホテル購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機(行き)とホテル購入'do
      it '飛行機とホテルを選択しているユーザーは飛行機とホテルを購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(行き)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_gos_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(行き)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_go_path(@country)
      # 情報を入力する
      plane_go_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneGo.count }.by(1)
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
      hotel_support
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

RSpec.describe "飛行機(帰り)とホテル購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機(帰り)とホテル購入'do
      it '飛行機とホテルを選択しているユーザーは飛行機とホテルを購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(帰り)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_backs_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(帰り)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country)
      # 情報を入力する
      plane_back_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneBack.count }.by(1)
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
      hotel_support
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

RSpec.describe "飛行機(行き)と飛行機(帰り)購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機(行き)と飛行機(帰り)'do
      it '飛行機(行き)と飛行機(帰り)を選択しているユーザーは飛行機(行き)と飛行機(帰り)を購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機(行き)を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(行き)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_gos_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(行き)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_go_path(@country)
      # 情報を入力する
      plane_go_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneGo.count }.by(1)
        # 国詳細ページへと移動する
        expect(current_path).to eq (country_path(@country.id))
        
      # 飛行機(帰り)を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(帰り)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_backs_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(帰り)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country)
      # 情報を入力する
      plane_back_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneBack.count }.by(1)
        # 国詳細ページへと移動する
        expect(current_path).to eq (country_path(@country.id))

      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@country)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_content("選択した飛行機情報")
      expect(page).to have_content("選択した飛行機情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
        find('input[name="commit"]').click
        sleep 2
      }.to change { Order.count & Info.count }.by(1)
      end
  end


end

RSpec.describe "飛行機(行き)と飛行機(帰り)購入", type: :system do
  before do
      
      @country = FactoryBot.create(:country)
     
   
  end

  context '飛行機(行き)と飛行機(帰り)とホテル'do
      it '飛行機(行き)と飛行機(帰り)とホテルを選択しているユーザーは飛行機(行き)と飛行機(帰り)とホテルを購入できる'do
      # ログインする
      sign_in(@country.user)
      # 国詳細ページを訪れる
      visit country_path(@country)

      # 飛行機(行き)を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(行き)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_gos_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(行き)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_go_path(@country)
      # 情報を入力する
      plane_go_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneGo.count }.by(1)
        # 国詳細ページへと移動する
        expect(current_path).to eq (country_path(@country.id))
        
      # 飛行機(帰り)を選択する！！！！！

      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(帰り)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_backs_path(@country)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(帰り)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country)
      # 情報を入力する
      plane_back_support
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
        find('input[name="commit"]').click
        }.to change { PlaneBack.count }.by(1)
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
        hotel_support
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
      expect(page).to have_content("選択した飛行機情報")
      expect(page).to have_content("選択したホテル情報")
      # 情報を入力する
      order_info_support
      # 送信するとOrderモデルInfoモデルの数が１上がる
      expect{
        find('input[name="commit"]').click
        sleep 2
      }.to change { Order.count & Info.count }.by(1)
     end
  end

end

RSpec.describe "ツアーのみ購入", type: :system do
  before do
      
      @tour = FactoryBot.create(:tour)
     
   
  end

  context 'ツアー購入'do
      it 'ツアーを選択しているユーザーはツアーを購入できる'do
      # ログインする
      sign_in(@tour.country.user)
      # 国詳細ページを訪れる
      visit country_path(@tour.country)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@tour.country)
      # 選択した飛行機の情報とホテルの情報がある
      expect(page).to have_content("選択したツアー情報")
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
      it '何も選択していない場合は購入できない'do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # 購入ページへのリンクがある
      expect(page).to have_content "購入ページにいく"
      # 購入ページを訪れる
      visit country_orders_path(@country1)
      # 購入ページには行けず国詳細ページのまま
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

