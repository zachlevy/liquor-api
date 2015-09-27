class StoresController < ApplicationController
  before_action :set_store, only: [:show, :update, :destroy]
  before_action :set_store_with_fields, only: :show

  # GET /store/1/inventories
  # GET /store/1/inventories.json
  def inventories
    @inventories = Inventory.where(store_id: params[:id]).order(lcbo_updated_on: :desc)

    render json: @inventories
  end

  # GET /store/1/interactions
  # GET /store/1/interactions.json
  def interactions
    @interactions = Interaction.where(store_id: params[:id]).order(date: :desc)

    render json: @interactions
  end

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all

    render json: @stores
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    render json: @store
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    @store = Store.find(params[:id])

    if @store.update(store_params)
      head :no_content
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy

    head :no_content
  end

  private
    def set_store_with_fields
      query = Store
      query = query.select(select_fields) unless params[:fields].nil?
      @store = query.find(params[:id])
    end

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:number, :store_class_id, :address, :city, :postal_code, :fax, :dead, :lat, :lng, :name, :phone, :lcbo_updated_at)
    end
end
