class DashboardController < ApplicationController
  def index
    @stores = current_user.stores
    @stores_count = @stores.count
  end
  
end
