class Club < ActiveRecord::Base
  has_many :people
  has_many :seasons

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
end