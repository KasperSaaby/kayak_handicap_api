class Api::V1::MembersController < Api::V1::BaseController

  def index
    members =
    if params[:participation_id]
      Member.joins(:participations).where(participations: { id: params[:participation_id] })
    else
      Member.joins(:club).where(clubs: { id: params[:club_id] })
    end

    render json: members, status: :ok
  end

  def create
    club = Club.find(params[:club_id])
    member = club.members.new(member_params)
    if member.save!
      render json: member, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    member = Member.find(params[:id])
    render json: MemberSerializer.resource(member), status: :ok
  end

  def update
    member = Member.find(params[:id])
    if member.update!(member_params)
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    member = Member.find(params[:id])
    if member.destroy!
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :sex)
  end
end
