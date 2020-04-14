
class Klass < ApplicationRecord
    has_many :character_klasses
    has_many :klass_spells
    has_many :characters, through: :character_klasses
    has_many :spells, through: :klass_spells

end