class CharacterKlass < ActiveRecord::Base

    belongs_to :character
    belongs_to :klass

    # attr_accessor :class_name, :level, :spell_list, :spells_known, :spell_list_by_level
    # def initialize(class_name, level)
    #     @class_name = class_name.downcase
    #     @level = level
    #     @spell_list = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/#{class_name}/spells").body)
    #     @spell_list_by_level = []
    #     @spells_known = []
    #     10.times { |i|
    #         @spells_known[i] = {"level #{i} spells" => []}
    #     }

    
end