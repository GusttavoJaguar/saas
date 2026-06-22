class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      @stores = current_user.stores
      @stores_count = @stores.count
      @bookings = Booking.where(store: @stores).order(scheduled_at: :asc).limit(10)
      @contacts = Contact.where(store: @stores).order(created_at: :desc).limit(10)
    end
  end
end
