class CreateKlassSpells < ActiveRecord::Migration[4.2]
    def change
        create_table :klass_spells do |t|
            t.integer :klass_id
            t.integer :spell_id
        end
    end
  end