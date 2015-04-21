class TimeKeeping < ActiveRecord::Base
  belongs_to :member
  belongs_to :race
end
