class Season < ActiveRecord::Base
  belongs_to :club
  has_many :races
end
