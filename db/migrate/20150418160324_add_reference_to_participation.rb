class AddReferenceToParticipation < ActiveRecord::Migration
  def change
    add_reference :participations, :boat_type, index: true
  end
end
