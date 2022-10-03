# {
#   "imageUrl": "/images/pokemon_snaps/1.svg",
#   "id": 1,
#   "number": 1,
#   "attack": 49,
#   "defense": 49,
#   "name": "Bulbasaur",
#   "type": "grass",
#   "moves": [
#     "tackle",
#     "vine whip"
#   ],
#   "captured": true,
#   "createdAt": "2020-12-16T01:17:24.119Z",
#   "updatedAt": "2020-12-16T01:17:24.119Z"
# }

json.image_url (@pokemon.captured ? @pokemon.image_url : '/images/unknown.png')
json.id @pokemon.id
json.number @pokemon.number
json.attack @pokemon.attack
json.defense @pokemon.defense
json.name @pokemon.name
json.type @pokemon.poke_type
json.moves @pokemon.moves.map {|move| move.name}
json.captured @pokemon.captured
json.createdAt @pokemon.created_at
json.updatedAt @pokemon.updated_at
