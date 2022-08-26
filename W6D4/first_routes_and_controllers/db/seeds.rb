# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


# Users
leonardo = User.create!(
  username: "Leonardo Da Vinci"
)

vincent = User.create!(
  username: "Vincent Van Gogh"
)

edward = User.create!(
  username: "Edward Munch" 
)

# artwork

mona_lisa = Artwork.create!(
    title: 'Mona Lisa',
    image_url: 'google.com/monalisa',
    artist_id: leonardo.id
)
starry_night = Artwork.create!(
    title: "Starry Night",
    image_url: "google.com/starrynight",
    artist_id: vincent.id
)
the_scream = Artwork.create!(
    title: "The Scream",
    image_url: "google.com/thescream",
    artist_id: edward.id
)

vincent_mona = ArtworkShare.create!(
  artwork_id: mona_lisa.id,
  viewer_id: vincent.id
)

edward_mona = ArtworkShare.create!(
  artwork_id: mona_lisa.id,
  viewer_id: edward.id
)

leonardo_scream = ArtworkShare.create!(
  artwork_id: the_scream.id,
  viewer_id: leonardo.id
)