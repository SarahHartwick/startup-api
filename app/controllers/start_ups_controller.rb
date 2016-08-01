class StartUpsController < ApplicationController
  before_action :set_start_up, only: [:show, :update, :destroy]

  # GET /start_ups
  # GET /start_ups.json
  def index
    @start_ups = StartUp.all

    render json: @start_ups
  end

  # GET /start_ups/1
  # GET /start_ups/1.json
  def show
    render json: @start_up
  end

  # POST /start_ups
  # POST /start_ups.json
  def create
    @start_up = StartUp.new(start_up_params)

    if @start_up.save
      render json: @start_up, status: :created, location: @start_up
    else
      render json: @start_up.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /start_ups/1
  # PATCH/PUT /start_ups/1.json
  def update
    @start_up = StartUp.find(params[:id])

    if @start_up.update(start_up_params)
      head :no_content
    else
      render json: @start_up.errors, status: :unprocessable_entity
    end
  end

  # DELETE /start_ups/1
  # DELETE /start_ups/1.json
  def destroy
    @start_up.destroy

    head :no_content
  end

  private

    def set_start_up
      @start_up = StartUp.find(params[:id])
    end

    def start_up_params
      params.require(:start_up).permit(:name, :description, :user_id, :owner,
      :problem, :solution, :market, :product, :competition, :advantage, :model,
      :strategy)
    end
end
