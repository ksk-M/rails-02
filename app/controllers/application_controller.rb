class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  # deviseのコントローラーの処理の時だけ :configure_permitted_parametersを実行する。

  protected
  def configure_permitted_parameters
    # ユーザー登録時(sign_up)にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # ユーザー編集時(account_update)にname、introduction、imageのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image])
  end
end
  ## 新規登録(sign_up)の際,デフォルトでは「メールアドレス」「パスワード」のみ受け付けるので、任意の項目を追加する。
  # devise_parameter_sanitizer.permit(:deviseの処理名, keys:[許可するキー])
  # deviseの処理名は、新規登録のため「sign_up」許可するキーは新しく作成した「name」カラム。
