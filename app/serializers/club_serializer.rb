class ClubSerializer
  include RestPack::Serializer

  attributes :id, :name, :uri, :lat, :lng, :email, :href

  can_include :members, :seasons
end