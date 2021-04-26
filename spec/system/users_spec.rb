require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時とできない時' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページにいく
      visit root_path
      # 新規登録ボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページにいく
      visit new_user_registration_path
      # ユーザー登録情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[last_name]', with: @user.last_name
      fill_in 'user[first_name]', with: @user.first_name
      fill_in 'user[last_name_kana]', with: @user.last_name_kana
      fill_in 'user[first_name_kana]', with: @user.first_name_kana
      select '2000', from: 'user[birthday(1i)]'
      select '12', from: 'user[birthday(2i)]'
      select '24', from: 'user[birthday(3i)]'
      # 会員登録を押したらユーザーモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページに移行する
      expect(current_path).to eq (root_path)
      # ログアウトボタンが表示される。新規登録・ログインボタンは表示されない。
      expect(page).to have_content ('ログアウト')
      expect(page).to have_no_content ('新規登録')
      expect(page).to have_no_content ('ログイン')
    end

    it '登録情報が入力されていなければ新規登録できない' do
      # トップページにいく
      visit root_path
      # 新規登録ボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # 登録情報を空にする
      fill_in 'user[nickname]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      fill_in 'user[last_name]', with: ''
      fill_in 'user[first_name]', with: ''
      fill_in 'user[last_name_kana]', with: ''
      fill_in 'user[first_name_kana]', with: ''
      select '--', from: 'user[birthday(1i)]'
      select '--', from: 'user[birthday(2i)]'
      select '--', from: 'user[birthday(3i)]'
      # 会員登録ボタンを押した時にユーザーモデルの数は変わらない
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # ページは変わらず新規登録ページである
      expect(current_path).to eq user_registration_path
    end

  end
end
  RSpec.describe 'ログイン', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
  context 'ログインができる時とできない時' do

    it 'ログインができる時'do
      # トップページにいく
      visit root_path
      # ログインボタンがある
      expect(page).to have_content('ログイン')
      # ログインページにいく
      visit new_user_session_path

      # ログイン情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページに移行する
      expect(current_path).to eq (root_path)
      # ログアウトボタンが表示される。新規登録・ログインボタンは表示されない。
      expect(page).to have_content ('ログアウト')
      expect(page).to have_no_content ('新規登録')
      expect(page).to have_no_content ('ログイン')

    end

    it 'ログインできない時'do
     # トップページにいく
     visit root_path
     # ログインボタンがある
     expect(page).to have_content('ログイン')
     # ログインページにいく
     visit new_user_session_path

     # ログイン情報を空で入力する
     fill_in 'user[email]', with: ''
     fill_in 'user[password]', with: ''
     # ログインボタンを押す
     find('input[name="commit"]').click
     # 変わらずログインページのまま
     expect(current_path).to eq (new_user_session_path)
    end
  end

  end


