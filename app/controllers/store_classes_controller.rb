class StoreClassesController < ApplicationController
  before_action :set_store_class, only: [:show, :update, :destroy]

  # GET /store_classes
  # GET /store_classes.json
  def index
    @store_classes = StoreClass.all

    render json: @store_classes
  end

  # GET /store_classes/1
  # GET /store_classes/1.json
  def show
    render json: @store_class
  end

  # POST /store_classes
  # POST /store_classes.json
  def create
    @store_class = StoreClass.new(store_class_params)

    if @store_class.save
      render json: @store_class, status: :created, location: @store_class
    else
      render json: @store_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_classes/1
  # PATCH/PUT /store_classes/1.json
  def update
    @store_class = StoreClass.find(params[:id])

    if @store_class.update(store_class_params)
      head :no_content
    else
      render json: @store_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_classes/1
  # DELETE /store_classes/1.json
  def destroy
    @store_class.destroy

    head :no_content
  end

  private

    def set_store_class
      @store_class = StoreClass.find(params[:id])
    end

    def store_class_params
      params.require(:store_class).permit(:name)
    end
end
