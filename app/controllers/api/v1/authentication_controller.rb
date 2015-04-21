class Api::V1::AuthenticationController < Api::V1::BaseController
  def create
    club = Club.find_by(uri: params[:uri])
    if club.present? && club.authenticate(params[:password])
      render json: club, status: :ok
    else
      head :bad_request
    end
  end
end
