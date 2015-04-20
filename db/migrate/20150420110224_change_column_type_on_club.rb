class ChangeColumnTypeOnClub < ActiveRecord::Migration
  def change
    change_column :clubs, :lat, :float
    change_column :clubs, :lng, :float
  end
end
