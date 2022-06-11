class Api::V1::DecodeController < Api::V1::BaseController
  before_action :set_url, only: [:show]

  def show
    if @url
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@url, serializer: UrlSerializer),
        message: 'Url fetched successfully',
        type: 'Success',
        status: 200
      }
    else
      render json: { 
        message: 'Url fetched unsuccessfully',
        status: 404
      },
      status: 404
    end
  end

  private

  def set_url
    @url = Url.find_by(token: params[:token])
  end
end
