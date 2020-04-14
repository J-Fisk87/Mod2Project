class CreateCharacterSpells < ActiveRecord::Migration[4.2]
    def change
        create_table :character_spells do |t|
            t.integer :character_id
            t.integer :spell_id
        end
    end
  end