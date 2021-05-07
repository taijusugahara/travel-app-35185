require 'rails_helper'

RSpec.describe 'PlaneBacks', type: :system do
  before do
    @country1 = FactoryBot.create(:country)
    @country2 = FactoryBot.create(:country)
  end

  context '飛行機選択' do
    it '国を選択しているユーザーは自身の飛行機を選択できる' do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(帰り)を選ぶ')
      # 飛行機一覧ページにいく
      visit country_plane_backs_path(@country1)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('飛行機(帰り)を予約する')
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country1)
      # 情報を入力する
      select '飛行機A', from: 'plane_back[name]'
      select '18000', from: 'plane_back[price]'
      fill_in 'plane_back[howmany]', with: 4
      select '2021', from: 'plane_back[back_date(1i)]'
      select '9', from: 'plane_back[back_date(2i)]'
      select '20', from: 'plane_back[back_date(3i)]'
      select '03:00', from: 'plane_back[back_time]'
      # 送信するとCountryモデルのカウントが１上がる。
      expect do
        find('input[name="commit"]').click
      end.to change { PlaneBack.count }.by(1)
      # 国詳細ページへと移動する
      expect(current_path).to eq(country_path(@country1.id))
      # 飛行機を変更するリンクがある
      expect(page).to have_content('飛行機(帰り)を変更する')
    end

    it '国を選択しているユーザーは他者の飛行機を選択できない' do
      # ログインする
      sign_in(@country1.user)
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country2)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end

    it 'ログインしてないユーザーは飛行機を選択できない' do
      # トップページを訪れる
      visit root_path
      # 飛行機選択ページを訪れる
      visit new_country_plane_back_path(@country1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Planes', type: :system do
  before do
    @plane1 = FactoryBot.create(:plane_back)
    @plane2 = FactoryBot.create(:plane_back)
  end
  context '飛行機変更' do
    it '飛行機を選択したユーザーは自身の飛行機を変更できる' do
      # ログインする
      sign_in(@plane1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane1.country)
      # 飛行機を選ぶリンクがある
      expect(page).to have_content('飛行機(帰り)を変更する')
      # 飛行機変更ページを訪れる
      visit edit_country_plane_back_path(@plane1.country, @plane1)
      # 情報を入力する
      select '飛行機B', from: 'plane_back[name]'
      select '22000', from: 'plane_back[price]'
      fill_in 'plane_back[howmany]', with: 5
      select '2021', from: 'plane_back[back_date(1i)]'
      select '11', from: 'plane_back[back_date(2i)]'
      select '30', from: 'plane_back[back_date(3i)]'
      select '09:00', from: 'plane_back[back_time]'
      # 送信する
      find('input[name="commit"]').click
      # 国詳細ページへ移動する
      expect(current_path).to eq country_path(@plane1.country)
      # 飛行機を変更するリンクがある
      expect(page).to have_content('飛行機(帰り)を変更する')
    end

    it '飛行機を選択したユーザーは他者の飛行機を変更できない' do
      # ログインする
      sign_in(@plane2.country.user)
      # 他者の飛行機変更ページを訪れる
      visit edit_country_plane_back_path(@plane1.country, @plane1)
      # トップページに移動させられる
      expect(current_path).to eq(root_path)
    end
    it 'ログインしてないユーザーは飛行機を変更できない' do
      # トップページを訪れる
      visit root_path
      # 飛行機変更ページを訪れる
      visit edit_country_plane_back_path(@plane1.country, @plane1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Planes', type: :system do
  before do
    @plane1 = FactoryBot.create(:plane_back)
    @plane2 = FactoryBot.create(:plane_back)
  end
  context '飛行機取り消し' do
    it '飛行機を選択したユーザーは自身の飛行機を取り消しできる' do
      # ログインする
      sign_in(@plane1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane1.country)
      # 飛行機取り消しリンクがある
      expect(page).to have_content('飛行機(帰り)を取り消す')
      # 飛行機取り消しリンクをクリックすると飛行機モデルのカウント数が１減る
      expect do
        find_link('飛行機(帰り)を取り消す', href: country_plane_back_path(@plane1.country, @plane1)).click
      end.to change { PlaneBack.count }.by(-1)
      # ページは国詳細ページのままで、飛行機を取り消しリンクは消えて飛行機を選ぶリンクが表示される
      expect(current_path).to eq(country_path(@plane1.country))
      expect(page).to have_content('飛行機(帰り)を選ぶ')
      expect(page).to have_no_content('飛行機(帰り)を取り消す')
    end

    it '飛行機を選択したユーザーは他者の飛行機を取り消すことはできない' do
      # ログインする
      sign_in(@plane2.country.user)
      # 国詳細ページを訪れる
      visit country_path(@plane1.country)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end

    it 'ログインしてないユーザーは飛行機を取り消しできない' do
      # トップページを訪れる
      visit root_path
      # 国詳細ページを訪れる
      visit country_path(@plane1.country)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
