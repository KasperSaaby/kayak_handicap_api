class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.time :start
      t.time :end
      t.references :person
      t.references :race

      t.timestamps null: false
    end
  end
end
