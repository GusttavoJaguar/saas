class DashboardController < ApplicationController
  before_action :authenticate_user!



  def index
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      @stores = current_user.stores
      @stores_count = @stores.count
    end
  end
end
