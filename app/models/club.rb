class Club < ActiveRecord::Base
  has_secure_password

  has_many :members
  has_many :seasons

  validates_presence_of :email
  validates_uniqueness_of :email
end
