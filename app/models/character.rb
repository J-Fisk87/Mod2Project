class Character < ApplicationRecord
    belong_to :user
    has_many :klasses, through: :character_klasses
    has_many :spells, through: :character_spells
end