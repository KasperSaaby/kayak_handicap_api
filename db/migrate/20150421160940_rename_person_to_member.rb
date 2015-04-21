class RenamePersonToMember < ActiveRecord::Migration
  def change
    rename_table :people, :members
    rename_table :participations_people, :members_participations
  end
end
