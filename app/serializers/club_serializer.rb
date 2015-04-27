class ClubSerializer < ActiveModel::Serializer
  attributes :id, :uri, :lat, :lng, :email, :links

  def links
    self_link = api_v1_club_url(object, only_path: true)
    {
        self: self_link,
        members: {
            related: self_link + '/members',
            linkage: object.members.map { |s| { type: :members, id: s.id } }
        },
        seasons: {
            related: self_link + '/seasons',
            linkage: object.seasons.map { |s| { type: :seasons, id: s.id } }
        }
    }
  end
end
