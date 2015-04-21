class RenamePersonColumnsToMemberColumns < ActiveRecord::Migration
  def change
    rename_column :members_participations, :person_id, :member_id
    rename_column :time_keepings, :person_id, :member_id
  end
end
