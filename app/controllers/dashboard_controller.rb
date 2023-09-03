class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @articles = current_user.articles
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to dashboard_show_path, notice: 'Данные обновлены.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name)
  end
end