class IdeasController < ProtectedController
  before_action :set_idea, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    render json: @ideas
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    render json: @idea
  end

  # POST /ideas
  # POST /ideas.json
  def create
  @idea = Idea.new(idea_params)
  @idea.user_id = @current_user.id

  if @idea.save
    render json: @idea, status: :created, location: @idea
  else
    render json: @idea.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /companies/1
# PATCH/PUT /companies/1.json
def update
  @idea = Idea.find(params[:id])
  if @idea.user_id == @current_user.id
    if @idea.update(idea_params)
      head :no_content
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end
end
  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy

    head :no_content
  end

  private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :problem, :solution,
       :market, :product, :model, :advantage, :strategy, :person, :owner, :user_id)
    end
end
