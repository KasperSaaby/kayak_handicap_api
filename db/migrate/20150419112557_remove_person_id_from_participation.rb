class RemovePersonIdFromParticipation < ActiveRecord::Migration
  def change
    remove_column :participations, :person_id
  end
end
