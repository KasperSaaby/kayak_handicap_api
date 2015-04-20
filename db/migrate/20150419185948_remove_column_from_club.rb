class RemoveColumnFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :salt
  end
end
