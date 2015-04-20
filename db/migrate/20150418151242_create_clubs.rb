class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :uri
      t.with_options precision: 15, scale: 10 do |c|
        c.decimal :lat
        c.decimal :lng
      end
      t.string :email
      t.string :password
      t.string :salt

      t.timestamps null: false
    end
  end
end
