class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: %i[show edit update destroy]

  # GET /stores
  def index
    @stores = Store.new
    @store = current_user.stores
  end

  # GET /stores/1
  def show
    @user = User.find_by!(username: params[:username])
    @stores = @user.stores
  
  end

  # GET /stores/new
  def new
    @store = current_user.stores.build
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  def create
    @store = current_user.stores.build(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: "Store criada com sucesso." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: "Store atualizada com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy

    respond_to do |format|
      format.html { redirect_to stores_path, notice: "Store removida com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_store
    @store = current_user.stores.friendly.find(params[:id])
  end

  def store_params
    params.require(:store).permit(
      :name,
      :description,
      :primary_color,
      :secondary_color,
      :navbar_text_color,
      :page_text_color,
      :logo,
      gallery_images: []
    )
  end
end