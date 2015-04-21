class Api::V1::AuthenticationController < Api::V1::BaseController
  def create
    club = Club.find_by(uri: params[:uri])
    if club.present? && club.authenticate(params[:password])
      club.auth_token = generate_access_token
      club.save!
      render json: club, status: :ok
    else
      head :bad_request
    end
  end

  private

  def generate_access_token
    begin
      token = SecureRandom.hex
    end while Club.exists?(auth_token: token)
    token
  end
end
