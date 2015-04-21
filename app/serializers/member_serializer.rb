class MemberSerializer
  include RestPack::Serializer

  attributes :name, :sex, :href

  can_include :club, :participations
end