class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

  def index
    @users = User.includes(:stores)
    @total_users = @users.count
    @total_stores = Store.count
    @stores = current_user.stores
  end
end
