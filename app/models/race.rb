class Race < ActiveRecord::Base
  belongs_to :season
  has_many :time_keepings
  has_many :participations
end
