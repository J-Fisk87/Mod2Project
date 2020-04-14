class CreateCharacterKlasses < ActiveRecord::Migration[4.2]
    def change
        create_table :character_klasses do |t|
            t.integer :character_id
            t.integer :klass_id
        end
    end
  end