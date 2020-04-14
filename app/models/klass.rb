class Klass < ApplicationRecord
    has_many :characters, through: :character_klasses
    has_many :spells, through: :klass_spells
end