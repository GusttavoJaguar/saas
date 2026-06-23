class BookingsController < ApplicationController
  before_action :set_store
  before_action :authenticate_user!, only: [ :index ]
  before_action :authorize_owner!, only: [ :index ]


  def index
    @bookings = @store.bookings.order(scheduled_at: :asc)
  endhas_many :available_slots, dependent: :destroy

  def create
    @booking = @store.bookings.new(booking_params.except(:scheduled_at))
    # parse scheduled_at coming from select (ISO8601 string)
    if booking_params[:scheduled_at].present?
      @booking.scheduled_at = Time.zone.parse(booking_params[:scheduled_at]) rescue nil
    end
    @booking.status = "pending"

    if @booking.scheduled_at.present? && @booking.save
      redirect_to public_store_path(@store), notice: "Agendamento enviado com sucesso. Entraremos em contato em breve."
    else
      flash.now[:alert] = "Não foi possível enviar o agendamento. Verifique os campos e tente novamente."
      render "public/store", status: :unprocessable_entity
    end
  end

  private

  def set_store
    @store = Store.friendly.find(params[:store_id])
  end

  def authorize_owner!
    return if @store.user == current_user

    redirect_to dashboard_path, alert: "Acesso negado."
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :phone, :scheduled_at, :notes)
  end
end
