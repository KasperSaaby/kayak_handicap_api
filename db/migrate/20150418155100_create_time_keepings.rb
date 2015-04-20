class CreateTimeKeepings < ActiveRecord::Migration
  def change
    create_table :time_keepings do |t|
      t.references :person
      t.references :race

      t.timestamps null: false
    end
  end
end
