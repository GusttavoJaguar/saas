class ContactsController < ApplicationController
  before_action :set_store
  before_action :authenticate_user!, only: [ :index ]
  before_action :authorize_owner!, only: [ :index ]

  def index
    @contacts = @store.contacts.order(created_at: :desc)
  end

  def create
    @contact = @store.contacts.new(contact_params)

    if @contact.save
      redirect_to public_store_path(@store), notice: "Mensagem enviada com sucesso. Entraremos em contato em breve."
    else
      flash.now[:alert] = "Não foi possível enviar sua mensagem. Verifique os campos e tente novamente."
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

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
