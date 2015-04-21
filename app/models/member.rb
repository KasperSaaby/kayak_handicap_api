class Member < ActiveRecord::Base
  belongs_to :club
  has_many :time_keepings
  has_and_belongs_to_many :participations
end
