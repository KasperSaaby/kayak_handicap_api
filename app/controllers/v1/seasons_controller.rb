class V1::SeasonsController < V1::BaseController
  def index
    seasons = Season.joins(:club).where(clubs: { id: params[:club_id] })
    render json: seasons, status: :ok
  end

  def create
    club = Club.find(params[:club_id])
    season = club.seasons.new(season_params)
    if season.save!
      render json: season, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    season = Season.find(params[:id])
    render json: season, status: :ok
  end

  def update
    season = Season.find(params[:id])
    if season.update!(season_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    season = Season.find(params[:id])
    if season.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def season_params
    params.require(:season).permit(:year, :point_system)
  end
end
