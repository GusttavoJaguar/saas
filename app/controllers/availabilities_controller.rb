class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store
  before_action :authorize_owner!

  def index
    @availabilities = @store.availabilities.order(:weekday, :start_time)
    @contact = Contact.new
    @contacts = @store.contacts.order(created_at: :desc)
    @bookings = @store.bookings.order(created_at: :desc)
  end

  def create
    @availability = @store.availabilities.new(availability_params)
    @availability.active = true
    if @availability.save
      redirect_to store_availabilities_path(@store), notice: "Disponibilidade adicionada."
    else
      flash.now[:alert] = "Falha ao adicionar disponibilidade."
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @availability = @store.availabilities.find(params[:id])
    @availability.destroy
    redirect_to store_availabilities_path(@store), notice: "Disponibilidade removida."
  end

  private

  def set_store
    @store = current_user.stores.friendly.find(params[:store_id])
  end

  def authorize_owner!
    redirect_to dashboard_path unless @store.user == current_user
  end

  def availability_params
    params.require(:availability).permit(:weekday, :start_time, :end_time)
  end
end
