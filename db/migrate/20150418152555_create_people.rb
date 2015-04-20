class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :sex
      t.references :club

      t.timestamps null: false
    end
  end
end
