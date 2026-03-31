class PublicController < ApplicationController
  def home
    @store = Store.first
  end

  def show
     @user = User.find_by(username: params[:username])

      if @user.nil?
        redirect_to root_path, alert: "Usuário não encontrado"
        return
      end
    
    @store = @user.stores.first
    @stores = @user.stores
  end
end
