class MembersController < ProtectedController
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  # GET /members/1.json
  def show
    render json: @member
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    if @member.idea.user_id == @current_user.id
      if @member.update(member_params)
        head :no_content
      else
        render json: @member.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    if @member.idea.user_id == @current_user.id
      @member.destroy

      head :no_content
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :title, :photo, :linkedin, :idea_id)
    end
end
