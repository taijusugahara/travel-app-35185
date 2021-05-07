require 'rails_helper'

RSpec.describe 'Hotels', type: :system do
  before do
    @country1 = FactoryBot.create(:country)
    @country2 = FactoryBot.create(:country)
  end

  context 'ホテル選択' do
    it '国を選択しているユーザーは自身のホテルを選択できる' do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # ホテルを選ぶリンクがある
      expect(page).to have_content('ホテルを選ぶ')
      # ホテルを選ぶリンクにいく
      visit country_hotels_path(@country1)
      # ホテルを予約するリンクがある
      expect(page).to have_content('ホテルを予約する')
      # ホテルを予約するリンク＝ホテル選択ページにいく
      visit new_country_hotel_path(@country1)
      # 情報を入力する
      select 'ホテルあいうえお', from: 'hotel[name]'
      select '3000', from: 'hotel[price]'
      fill_in 'hotel[howmany]', with: '2'
      fill_in 'hotel[day]', with: '2'
      select '2021', from: 'hotel[go_date(1i)]'
      select '8', from: 'hotel[go_date(2i)]'
      select '20', from: 'hotel[go_date(3i)]'
      select '2021', from: 'hotel[back_date(1i)]'
      select '8', from: 'hotel[back_date(2i)]'
      select '22', from: 'hotel[back_date(3i)]'
      # 送信するとHotelモデルのカウントが１上がる。
      expect do
        find('input[name="commit"]').click
      end.to change { Hotel.count }.by(1)
      # 国詳細ページへと移動する
      expect(current_path).to eq(country_path(@country1.id))
      # ホテルを変更するリンクがある
      expect(page).to have_content('ホテルを変更する')
    end
    it '国を選択しているユーザーは他者のホテルを選択できない' do
      # ログインする
      sign_in(@country1.user)
      # ホテル選択ページを訪れる
      visit new_country_hotel_path(@country2)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end
    it 'ログインしてないユーザーはホテルを選択できない' do
      # トップページを訪れる
      visit root_path
      # ホテル選択ページを訪れる
      visit new_country_plane_path(@country1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Hotels', type: :system do
  before do
    @hotel1 = FactoryBot.create(:hotel)
    @hotel2 = FactoryBot.create(:hotel)
  end
  context 'ホテル変更' do
    it 'ホテルを選択したユーザーは自身のホテルを変更できる' do
      # ログインする
      sign_in(@hotel1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@hotel1.country)
      # ホテルを変更するリンクがある
      expect(page).to have_content('ホテルを変更する')
      # ホテルを変更するリンク＝ホテル変更ページにいく
      visit edit_country_hotel_path(@hotel1.country, @hotel1)
      # 情報を入力する
      select 'ホテルかきくけこ', from: 'hotel[name]'
      select '5000', from: 'hotel[price]'
      fill_in 'hotel[howmany]', with: '4'
      fill_in 'hotel[day]', with: '3'
      select '2021', from: 'hotel[go_date(1i)]'
      select '9', from: 'hotel[go_date(2i)]'
      select '20', from: 'hotel[go_date(3i)]'
      select '2021', from: 'hotel[back_date(1i)]'
      select '9', from: 'hotel[back_date(2i)]'
      select '23', from: 'hotel[back_date(3i)]'
      # 情報を送信する
      find('input[name="commit"]').click
      # 国詳細ページへと移動する
      expect(current_path).to eq(country_path(@hotel1.country))
      # ホテルを変更するリンクがある
      expect(page).to have_content('ホテルを変更する')
    end

    it 'ホテルを選択しているユーザーは他者のホテルを変更できない' do
      # ログインする
      sign_in(@hotel1.country.user)
      # ホテル変更ページを訪れる
      visit edit_country_hotel_path(@hotel2.country, @hotel2)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end
    it 'ログインしてないユーザーはホテルを変更できない' do
      # トップページを訪れる
      visit root_path
      # ホテル変更ページを訪れる
      visit edit_country_plane_path(@hotel1.country, @hotel1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
RSpec.describe 'Hotels', type: :system do
  before do
    @hotel1 = FactoryBot.create(:hotel)
    @hotel2 = FactoryBot.create(:hotel)
  end
  context 'ホテル取り消し' do
    it 'ホテルを選択したユーザーは自身のホテルを取り消すことができる' do
      # ログインする
      sign_in(@hotel1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@hotel1.country)
      # ホテルを取り消すリンクがある
      expect(page).to have_content('ホテルを取り消す')
      # ホテルを取り消すリンクをクリックすると選択したホテルの情報が消える
      expect do
        find_link('ホテルを取り消す', href: country_hotel_path(@hotel1.country, @hotel1)).click
      end.to change { Hotel.count }.by(-1)
      # ページは国詳細ページのままで、ホテルを取り消しリンクは消えてホテルを選ぶリンクが表示される
      expect(current_path).to eq(country_path(@hotel1.country))
      expect(page).to have_content('ホテルを選ぶ')
      expect(page).to have_no_content('ホテルを取り消す')
    end
    it 'ホテルを選択しているユーザーは他者のホテルを変更できない' do
      # ログインする
      sign_in(@hotel1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@hotel2.country)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end
    it 'ログインしてないユーザーはホテルを変更できない' do
      # トップページを訪れる
      visit root_path
      # 国詳細ページを訪れる
      visit country_path(@hotel1.country)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
