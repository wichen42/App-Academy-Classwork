# [
#   {
#     "id": 1,
#     "number": 1,
#     "name": "Bulbasaur",
#     "imageUrl": "/images/pokemon_snaps/1.svg",
#     "captured": true
#   },
#   // ...
# ]
json.array! @pokemons do |pokemon|
  json.id pokemon.id
  json.number pokemon.number
  json.name pokemon.name
  json.image_url (pokemon.captured ? pokemon.image_url : '/images/unknown.png')
  json.captured pokemon.captured
end