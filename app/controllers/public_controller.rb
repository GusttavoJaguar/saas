class PublicController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def home
    @user = User.find_by(username: params[:username])

      if @user.nil?
        redirect_to root_path, alert: "Usuário não encontrado"
        return
      end
    
    @store = @user.stores.first
    
    if user_signed_in?
      @stores = current_user.stores
    else
      @stores = Store.limit(5) # ou vazio
    end
  end


  def show
    @store = Store.find(params[:id])
  end


  def store
    @store = Store.find(params[:id])
  end

end