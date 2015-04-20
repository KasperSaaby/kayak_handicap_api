class V1::ParticipationsController < V1::BaseController
  def index
    parent = participation_scope
    participations = parent.participations
    render json: participations, status: :ok
  end

  def create
    parent = participation_scope
    participation = Participation.new(participation_params)
    parent.participations << participation
    if participation.save!
      render json: participation, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    participation = Participation.find(params[:id])
    render json: participation, status: :ok
  end

  def update
    participation = Participation.find(params[:id])
    if participation.update!(participation_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    participation = Participation.find(params[:id])
    if participation.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:start, :end)
  end

  def participation_scope
    if params[:race_id]
      Race.find(params[:race_id])
    else
      Person.find(params[:person_id])
    end
  end
end
