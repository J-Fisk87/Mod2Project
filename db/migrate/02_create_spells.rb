class CreateSpells < ActiveRecord::Migration[4.2]
    def change
        create_table :spells do |t|
            t.string :name
            t.integer :level
            t.string :desc
        end
    end
  end