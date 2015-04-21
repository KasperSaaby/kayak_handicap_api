class AddTokenToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :auth_token, :string
  end
end
