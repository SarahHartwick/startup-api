class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :update, :destroy]

  def sign
    @expires = 10.hours.from_now.utc.iso8601
    render json: {
      acl: 'public-read',
      awsaccesskeyid: ENV['AWS_ACCESS_KEY_ID'],
      bucket: 'sarahhartwick',
      expires: @expires,
      key: "uploads/#{params[:name]}",
      policy: policy,
      signature: signature,
      success_action_status: '201',
      'Content-Type' => params[:type],
      'Cache-Control' => 'max-age=630720000, public'
    }, status: :ok
  end

  def signature
  Base64.strict_encode64(
    OpenSSL::HMAC.digest(
      OpenSSL::Digest::Digest.new('sha1'),
      ENV['AWS_SECRET_ACCESS_KEY'],
      policy({ secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] })
    )
  )
end

def policy(options = {})
  Base64.strict_encode64(
    {
      expiration: @expires,
      conditions: [
        { bucket: 'sarahhartwick' },
        { acl: 'public-read' },
        { expires: @expires },
        { success_action_status: '201' },
        [ 'starts-with', '$key', '' ],
        [ 'starts-with', '$Content-Type', '' ],
        [ 'starts-with', '$Cache-Control', '' ],
        [ 'content-length-range', 0, 524288000 ]
      ]
    }.to_json
  )
end
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    render json: @uploads
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    render json: @upload
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      render json: @upload, status: :created, location: @upload
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    if @upload.update(upload_params)
      head :no_content
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy

    head :no_content
  end

  private

    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.require(:upload).permit(:location, :idea_id)
    end
end
