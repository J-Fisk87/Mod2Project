# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



klasses = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/").body) 
klasses['results'].each { |klass|
    Klass.new(name: (klass['name'].downcase)).save
}


response = RestClient.get("http://www.dnd5eapi.co/api/spells")
spells = JSON.parse(response.body)
spells["results"].length.times { |i|
    spell = JSON.parse(RestClient.get("http://www.dnd5eapi.co#{spells['results'][i]['url']}").body)
    Spell.new(name: spell['name'], level: spell['level'], desc: spell['desc']).save
 }   

 
 Klass.all.each { |klass|
    spell_list = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/#{(klass.name.downcase)}/spells").body)
    if spell_list['count'] != 0
        spell_list['results'].each { |spell|
            match = Spell.all.find { |x| x.name == spell['name']}
            klass.spells.push(match)
            
        }
    end
 }

test_character1 = Character.new(name: "lvl5bard")
test_character1.klasses << Klass.find_by(name: "bard")
test_character1.klasses.last.character_klasses.last.level = 5

test_character2 = Character.new(name: "lvl10wizard_lvl3monk")
test_character2.klasses << Klass.find_by(name: "wizard")
test_character2.klasses.last.character_klasses.last.level = 10
test_character2.klasses << Klass.find_by(name: "monk")
test_character2.klasses.last.character_klasses.last.level = 3

test_character3 = Character.new(name: "lvl5sorcerer_lvl2ranger")
test_character3.klasses << Klass.find_by(name: "sorcerer")
test_character3.klasses.last.character_klasses.last.level = 5
test_character3.klasses << Klass.find_by(name: "ranger")
test_character3.klasses.last.character_klasses.last.level = 2

test_character4 = Character.new(name: "nonknownspellcaster")
test_character4.klasses << Klass.find_by(name: "druid")
test_character4.klasses.last.character_klasses.last.level = 4
test_character4.klasses << Klass.find_buy(name: "fighter")
test_character4.klasses.last.character_klasses.last.level = 8





