class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :set_inventory_with_fields, only: :show

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all

    render json: @inventories
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    render json: @inventory
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      render json: @inventory, status: :created, location: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    @inventory = Inventory.find(params[:id])

    if @inventory.update(inventory_params)
      head :no_content
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy

    head :no_content
  end

  private
    def set_inventory_with_fields
      query = Inventory
      query = query.select(select_fields) unless params[:fields].nil?
      @inventory = query.find(params[:id])
    end

    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:product_id, :store_id, :quantity, :sales, :shipment, :lcbo_updated_on, :lcbo_updated_at)
    end
end
