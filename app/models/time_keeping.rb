class TimeKeeping < ActiveRecord::Base
  belongs_to :person
  belongs_to :race
end
