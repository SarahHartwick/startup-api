class CompetitorsController < ProtectedController
  before_action :set_competitor, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /competitors
  # GET /competitors.json
  def index
    @competitors = Competitor.all

    render json: @competitors
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
    render json: @competitor
  end

  # POST /competitors
  # POST /competitors.json
  def create
    @competitor = Competitor.new(competitor_params)

    if @competitor.save
      render json: @competitor, status: :created, location: @competitor
    else
      render json: @competitor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /competitors/1
  # PATCH/PUT /competitors/1.json
  def update
    @competitor = Competitor.find(params[:id])
    if @competitor.idea.user_id == @current_user.id
      if @competitor.update(competitor_params)
        head :no_content
      else
        render json: @competitor.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /competitors/1
  # DELETE /competitors/1.json
  def destroy
    if @competitor.idea.user_id == @current_user.id
      @competitor.destroy

      head :no_content
    else
      render json: @competitor.errors, status: :unprocessable_entity
    end
  end

  private

    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    def competitor_params
      params.require(:competitor).permit(:name, :description, :url, :idea_id)
    end
end
