class UsersController < ApplicationController

  def edit
  end

  # そのユーザーの入力情報に更新
  def update
    if current_user.update(user_params)
      redirect_to root_path
    # 正しく更新できなければ戻る
    else
      render :edit
    end
  end

  private

  def user_params
    # そのユーザー自身の名前とメールアドレスを許可
    params.require(:user).permit(:name, :email)
  end

end
