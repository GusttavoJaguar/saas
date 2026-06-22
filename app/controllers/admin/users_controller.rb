class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  
  def index
    @users = User.order(created_at: :desc)
  end



  def destroy
    @users = User.find(params[:id])
    @users.destroy
    @users.stores.destroy_all
    redirect_to admin_users_path, notice: "Usuário excluído com sucesso."
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
