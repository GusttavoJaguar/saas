class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!

  def index
    @stores = current_user.stores
  end
end
