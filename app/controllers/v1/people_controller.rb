class V1::PeopleController < V1::BaseController

  def index
    people =
    if params[:participation_id]
      Person.joins(:participations).where(participations: { id: params[:participation_id] })
    else
      Person.joins(:club).where(clubs: { id: params[:club_id] })
    end

    render json: people, status: :ok
  end

  def create
    club = Club.find(params[:club_id])
    person = club.people.new(person_params)
    if person.save!
      render json: person, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    person = Person.find(params[:id])
    render json: person, status: :ok
  end

  def update
    person = Person.find(params[:id])
    if person.update!(person_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    person = Person.find(params[:id])
    if person.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :sex)
  end
end
