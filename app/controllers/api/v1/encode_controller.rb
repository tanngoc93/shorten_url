class Api::V1::EncodeController < Api::V1::BaseController

  def create
    url = Url.new(url_params)

    if url.save
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(url, serializer: UrlSerializer),
        message: 'Url created successfully',
        type: 'Success',
        status: 200
      }
    else
      render json: {
        message: url.errors.full_messages.to_sentence,
        status: 400
      },
      status: 400
    end
  end

  private

  def url_params
    params.permit(:original_url)
  end
end
