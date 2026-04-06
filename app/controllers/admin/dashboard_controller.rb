class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

  def index
    @users = User.includes(:stores)
    @total_users = @users.count
    @total_stores = Store.count
    @stores = current_user.stores
    @stores_count = @stores.count
    @user_count = @users.count
  end

  
  def require_admin
    redirect_to root_path unless current_user.admin?
  end


end
