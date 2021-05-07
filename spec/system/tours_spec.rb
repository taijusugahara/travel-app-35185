require 'rails_helper'

RSpec.describe 'Tours', type: :system do
  before do
    @country1 = FactoryBot.create(:country)
    @country2 = FactoryBot.create(:country)
  end

  context 'ツアー選択' do
    it '国を選択しているユーザーは自身のツアーを選択できる' do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # 飛行機を選ぶリンクがある
      expect(page).to have_content('ツアーを選ぶ')
      # 飛行機一覧ページにいく
      visit country_tours_path(@country1)
      # 飛行機を予約するリンクがある
      expect(page).to have_content('ツアーを予約する')
      # 飛行機選択ページを訪れる
      visit new_country_tour_path(@country1)
      # 情報を入力する
      select 'ツアーA', from: 'tour[name]'
      select '100000', from: 'tour[price]'
      select '5', from: 'tour[span]'
      fill_in 'tour[howmany]', with: 4
      select '2021/10/10', from: 'tour[go_date]'
      # 送信するとCountryモデルのカウントが１上がる。
      expect do
        find('input[name="commit"]').click
      end.to change { Tour.count }.by(1)
      # 国詳細ページへと移動する
      expect(current_path).to eq(country_path(@country1.id))
      # 飛行機を変更するリンクがある
      expect(page).to have_content('ツアーを変更する')
    end

    it '国を選択しているユーザーは他者のツアーを選択できない' do
      # ログインする
      sign_in(@country1.user)
      # ツアー選択ページを訪れる
      visit new_country_tour_path(@country2)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end

    it 'ログインしてないユーザーはツアーを選択できない' do
      # トップページを訪れる
      visit root_path
      # ツアー選択ページを訪れる
      visit new_country_tour_path(@country1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Tours', type: :system do
  before do
    @tour1 = FactoryBot.create(:tour)
    @tour2 = FactoryBot.create(:tour)
  end
  context 'ツアー変更' do
    it 'ツアーを選択したユーザーは自身のツアーを変更できる' do
      # ログインする
      sign_in(@tour1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@tour1.country)
      # ツアーを選ぶリンクがある
      expect(page).to have_content('ツアーを変更する')
      # ツアー変更ページを訪れる
      visit edit_country_tour_path(@tour1.country, @tour1)
      # 情報を入力する
      select 'ツアーB', from: 'tour[name]'
      select '150000', from: 'tour[price]'
      select '7', from: 'tour[span]'
      fill_in 'tour[howmany]', with: 3
      select '2021/11/10', from: 'tour[go_date]'
      # 送信する
      find('input[name="commit"]').click
      # 国詳細ページへ移動する
      expect(current_path).to eq country_path(@tour1.country)
      # ツアーを変更するリンクがある
      expect(page).to have_content('ツアーを変更する')
    end

    it '飛行機を選択したユーザーは他者のツアーを変更できない' do
      # ログインする
      sign_in(@tour2.country.user)
      # 他者のツアー変更ページを訪れる
      visit edit_country_plane_go_path(@tour1.country, @tour1)
      # トップページに移動させられる
      expect(current_path).to eq(root_path)
    end
    it 'ログインしてないユーザーはツアーを変更できない' do
      # トップページを訪れる
      visit root_path
      # ツアー変更ページを訪れる
      visit edit_country_plane_go_path(@tour1.country, @tour1)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Tours', type: :system do
  before do
    @tour1 = FactoryBot.create(:tour)
    @tour2 = FactoryBot.create(:tour)
  end
  context 'ツアー取り消し' do
    it 'ツアーを選択したユーザーは自身のツアーを取り消しできる' do
      # ログインする
      sign_in(@tour1.country.user)
      # 国詳細ページを訪れる
      visit country_path(@tour1.country)
      # ツアー取り消しリンクがある
      expect(page).to have_content('ツアーを取り消す')
      # ツアー取り消しリンクをクリックするとツアーモデルのカウント数が１減る
      expect do
        find_link('ツアーを取り消す', href: country_tour_path(@tour1.country, @tour1)).click
      end.to change { Tour.count }.by(-1)
      # ページは国詳細ページのままで、飛行機を取り消しリンクは消えて飛行機を選ぶリンクが表示される
      expect(current_path).to eq(country_path(@tour1.country))
      expect(page).to have_content('ツアーを選ぶ')
      expect(page).to have_no_content('ツアーを取り消す')
    end

    it '飛行機を選択したユーザーは他者のツアーを取り消すことはできない' do
      # ログインする
      sign_in(@tour2.country.user)
      # 国詳細ページを訪れる
      visit country_path(@tour1.country)
      # トップページに移行させられる
      expect(current_path).to eq root_path
    end

    it 'ログインしてないユーザーはツアーを取り消しできない' do
      # トップページを訪れる
      visit root_path
      # 国詳細ページを訪れる
      visit country_path(@tour1.country)
      # ログインページに移行させられる
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
