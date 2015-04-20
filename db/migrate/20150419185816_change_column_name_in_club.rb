class ChangeColumnNameInClub < ActiveRecord::Migration
  def change
    rename_column :clubs, :password, :password_digest
  end
end
