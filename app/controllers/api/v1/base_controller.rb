class Api::V1::BaseController < Api::V1::ExceptionsController
  before_action :authenticate

  def authenticate
    # authenticate_or_request_with_http_token do |token, options|
    #   Club.exists?(auth_token: token)
    # end
  end
end
