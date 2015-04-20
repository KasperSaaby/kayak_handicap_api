class V1::ClubsController < V1::BaseController
  def index
    clubs = Club.all
    render json: clubs, status: :ok
  end

  def create
    club = Club.new(club_params)
    if club.save!
      render json: club, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    club = Club.find(params[:id])
    render json: club, status: :ok
  end

  def update
    club = Club.find(params[:id])
    if club.update!(club_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    club = Club.find(params[:id])
    if club.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :uri, :lat, :lng, :email, :password, :password_confirmation)
  end
end
