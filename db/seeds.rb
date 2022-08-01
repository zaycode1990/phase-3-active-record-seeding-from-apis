# Add seed data in this file
# these are the spells we want to add to the database
puts "Seeding spells..."


# iterate over each spell
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]
 # make a request to the endpoint for the individual spell:
spells.each do |spell|
    
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
    
# use JSON.parse to convert this string to a Ruby hash:
# the response will come back as a JSON-formatted string.
spell_hash = JSON.parse(response)

Spell.create(
    name: spell_hash["name"],
    level: spell_hash["level"],
     # spell_hash["desc"] returns an array, so we need to access the first index to get just a string of the description
    description: spell_hash["desc"][0] 
)
end

puts "Done seeding!"