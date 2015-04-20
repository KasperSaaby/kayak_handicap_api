class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.datetime :date
      t.float :air_temperature, limit: 30
      t.float :wind_speed, limit: 30
      t.string :wind_direction
      t.references :season

      t.timestamps null: false
    end
  end
end
