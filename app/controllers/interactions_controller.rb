class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :update, :destroy]

  # GET /interactions
  # GET /interactions.json
  def index
    @interactions = Interaction.all

    render json: @interactions
  end

  # GET /interactions/1
  # GET /interactions/1.json
  def show
    render json: @interaction
  end

  # POST /interactions
  # POST /interactions.json
  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      render json: @interaction, status: :created, location: @interaction
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interactions/1
  # PATCH/PUT /interactions/1.json
  def update
    @interaction = Interaction.find(params[:id])

    if @interaction.update(interaction_params)
      head :no_content
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.json
  def destroy
    @interaction.destroy

    head :no_content
  end

  private

    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params.require(:interaction).permit(:product_id, :store_id, :date, :comment)
    end
end
