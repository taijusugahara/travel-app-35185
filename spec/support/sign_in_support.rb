module SignInSupport
  def sign_in(user)
    # トップページにいく
    visit root_path
    # ログインボタンがある
    expect(page).to have_content('ログイン')
    # ログインページにいく
    visit new_user_session_path

    # ログイン情報を入力する
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    # ログインボタンを押す
    find('input[name="commit"]').click
    # トップページに移行する
    expect(current_path).to eq(root_path)
    # ログアウトボタンが表示される。新規登録・ログインボタンは表示されない。
    expect(page).to have_content('ログアウト')
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end
end
