class SessionsController < ApplicationController
  def new
  end

  def create
  # フォームから送られたIDとパスワードを取得
  id = params[:id]
  password = params[:password]

  # データベースから、入力されたIDに一致するユーザーを検索
  user = User.find_by(uid: id)

  # 認証ロジック
  # ユーザーが見つかり、かつパスワードが一致する場合
  if user && user.pass == password
    # ログイン成功
    # セッションキーを課題指定の `:login_uid` に変更
    session[:login_uid] = user.uid 

    # 成功ページへリダイレクト
    redirect_to home_path
  else
    # ログイン失敗
    # 失敗ページへリダイレクト
    redirect_to login_failure_path, alert: "IDまたはパスワードが正しくありません。"
  end
  end
  
  def destroy
  # セッションからログイン情報を削除する
  session.delete(:login_uid) 
  
  # ログイン画面に戻す
  redirect_to login_path, notice: "ログアウトしました。"
  end
  
  def home
    
  end
  
  def failure
  # 失敗ページを表示するだけなので処理はなし
  end
  
end
