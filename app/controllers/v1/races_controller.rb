class V1::RacesController < V1::BaseController
  def index
    races = Race.joins(:season).where(seasons: { id: params[:season_id] })
    render json: races, status: :ok
  end

  def create
    season = Season.find(params[:season_id])
    race = season.races.new(race_params)
    if race.save!
      render json: race, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    race = Race.find(params[:id])
    render json: race, status: :ok
  end

  def update
    race = Race.find(params[:id])
    if race.update!(race_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    race = Race.find(params[:id])
    if race.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def race_params
    params.require(:race).permit(:date, :air_temperature, :wind_speed, :wind_direction)
  end
end
