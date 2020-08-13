class ApplicationController < ActionController::Base
  # 未ログインならサインアップの画面に遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時のみ、nameカラムを許容
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
