require 'rails_helper'

RSpec.describe "国関連", type: :system do
  
    before do
      @user = FactoryBot.create(:user)
      @country_name = 'タイ'
    end

  context '国情報を登録'do
    it 'ログインしたユーザーは国情報を登録できる' do
      # ログインする
      sign_in(@user)
      # 国を選ぶというリンクがある
      expect(page).to have_content('国を選ぶ')
      # 国選択ページにいく
      visit new_country_path
      # 情報を入力する
      select @country_name, from: 'country[name]'
      # 送信するとCountryモデルのカウントが１上がる。
      expect{
      find('input[name="commit"]').click
      }.to change { Country.count }.by(1)
      # expect(current_path).to eq (country_planes_path(@country_id))
      # ページを移動すると国を選び直す、トップページに戻るリンクがある。
   
      expect(page).to have_content('トップページに戻る')
    end
    
  
    it 'ログインしていないユーザーは国情報を登録できない' do
      # トップページにいく
      visit root_path
      # 国選択ページにいこうとする
      visit new_country_path
      # ログインページへと移動させられる
      expect(current_path).to eq (new_user_session_path)
    end
  end


end

RSpec.describe "国関連", type: :system do
  
  before do
    @country1 = FactoryBot.create(:country)
    
    @country2 = FactoryBot.create(:country)
  end

  context '国情報の詳細ページ'do
    it 'ログインしているユーザーは自身の国情報の詳細ページにいくことができる' do
      # ログインする
      sign_in(@country1.user)
      # 国詳細ページを訪れる
      visit country_path(@country1)
      # 選択した国名がある
      expect(page).to have_content("#{@country1.name}へようこそ！")
      # トップページに戻るリンクがある
      expect(page).to have_content('トップページに戻る')
      

    end
    it 'ログインしているユーザーは他の人の国情報詳細ページに移動できない' do
      # ログインする
      sign_in(@country2.user)
      # 国の詳細ページを訪れる
      visit country_path(@country1)
      # トップページに移動させられる
      expect(current_path).to eq (root_path)
    
    end

    it 'ログインしていないユーザーは国情報詳細ページに移動できない' do
      # トップページにいく
      visit root_path
      # 国の詳細ページを訪れる
      visit country_planes_path(@country1)
      # ログインページへと移動させられる
      expect(current_path).to eq (new_user_session_path)
    end
  end
end



RSpec.describe "国関連", type: :system do
  
  before do
    @country1 = FactoryBot.create(:country)
    
    @country2 = FactoryBot.create(:country)
  end

  context '国情報を削除'do
    it 'ログインしているユーザーは自身の国情報を削除できる' do
      # ログインする
      sign_in(@country1.user)
      # 国の詳細ページを訪れる
      visit country_path(@country1)
      # トップページに戻るリンクがある
      expect(page).to have_content('トップページに戻る')
      # トップページに戻るリンクをクリック(削除パスに飛ぶ)とcountryモデルのカウントが１減る
      expect{
        find_link('トップページに戻る', href: country_path(@country1)).click
      }.to change { Country.count }.by(-1)
      expect(current_path).to eq (root_path)

    end
    it 'ログインしているユーザーは他の人の国情報を削除できない' do
      # ログインする
      sign_in(@country2.user)
      # 国の詳細ページを訪れる
      visit country_path(@country1)
      # トップページに移動させられる
      expect(current_path).to eq (root_path)
    
    end

    it 'ログインしていないユーザーは国情報を削除できない' do
      # トップページにいく
      visit root_path
      # 国の詳細ページを訪れる
      visit country_planes_path(@country1)
      # ログインページへと移動させられる
      expect(current_path).to eq (new_user_session_path)
    end
  end
end