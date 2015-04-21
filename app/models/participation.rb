class Participation < ActiveRecord::Base
  belongs_to :boat_type
  belongs_to :race
  has_and_belongs_to_many :members
end
