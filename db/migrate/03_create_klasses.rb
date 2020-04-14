class CreateKlasses < ActiveRecord::Migration[4.2]
    def change
        create_table :klasses do |t|
            t.string :name
            t.integer :level
        end
    end
  end