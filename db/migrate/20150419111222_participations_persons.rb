class ParticipationsPersons < ActiveRecord::Migration
  def change
    create_table :participations_persons do |t|
      t.belongs_to :participation, index: true
      t.belongs_to :person, index: true
    end
  end
end
