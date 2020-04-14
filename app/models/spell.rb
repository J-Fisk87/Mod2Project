class Spell < ApplicationRecord
    has_many :characters, through: :character_spells
    has_many :klasses, through: :klass_spells
end