class RenameTableParticipationsPersons < ActiveRecord::Migration
  def change
    rename_table :participations_persons, :participations_people
  end
end
