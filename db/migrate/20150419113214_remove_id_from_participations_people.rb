class RemoveIdFromParticipationsPeople < ActiveRecord::Migration
  def change
    remove_column :participations_people, :id
  end
end
