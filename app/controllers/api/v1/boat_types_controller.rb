class Api::V1::BoatTypesController < Api::V1::BaseController
  def index
    boat_types = BoatType.all
    render json: boat_types, status: :ok
  end

  def create
    boat_type = BoatType.new(boat_type_params)
    if boat_type.save!
      render json: boat_type, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    boat_type = BoatType.find(params[:id])
    render json: boat_type, status: :ok
  end

  def update
    boat_type = BoatType.find(params[:id])
    if boat_type.update!(boat_type_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    boat_type = BoatType.find(params[:id])
    if boat_type.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def boat_type_params
    params.require(:boat_type).permit(:name, :seats)
  end
end
