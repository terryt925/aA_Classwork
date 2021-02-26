# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
    { username: 'Vincent Van Gogh' },
    { username: 'Pablo Picasso' },
    { username: 'Claude Monet' },
    { username: 'Rembrandt Harmenszoon van Rijn' },
    { username: 'Grant Wood' },
    { username: 'Shiba Kokan' }
  ])
artworks = Artwork.create([
    { title: 'The Wave', artist_id: users[5].id, image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen" },
    { title: 'American Gothic', artist_id: users[4].id, image_url: "https://www.google.com/imgres?imgurl=https%3A" },
    { title: 'Starry Night', artist_id: users[0].id, image_url: "https://www.google.com/imgres?imgurl=https%3A%2F" },
    { title: 'Girl With a Mandolin', artist_id: users[1].id, image_url: "https://s31531.pcdn.co/wp-content/upload" },
    { title: 'Three Musicians', artist_id: users[1].id, image_url: "https://s31531.pcdn.co/wp-content/uploads/201" },
    { title: 'Water Lilies', artist_id: users[2].id, image_url: "https://www.kunstmuseum.nl/en" },
    { title: 'The Anatomy Lesson of Dr. Nicolaes Tulp', artist_id: users[3].id, image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%=RBDGmv" }
  ])
shares = ([
    { artwork_id: artworks[0].id, viewer_id: users[0].id },
    { artwork_id: artworks[0].id, viewer_id: users[1].id },
    { artwork_id: artworks[0].id, viewer_id: users[2].id },
    { artwork_id: artworks[1].id, viewer_id: users[0].id },
    { artwork_id: artworks[1].id, viewer_id: users[3].id },
    { artwork_id: artworks[1].id, viewer_id: users[5].id },
    { artwork_id: artworks[2].id, viewer_id: users[1].id },
    { artwork_id: artworks[2].id, viewer_id: users[3].id },
    { artwork_id: artworks[2].id, viewer_id: users[4].id },
    { artwork_id: artworks[3].id, viewer_id: users[0].id },
    { artwork_id: artworks[3].id, viewer_id: users[4].id },
    { artwork_id: artworks[3].id, viewer_id: users[5].id },
    { artwork_id: artworks[4].id, viewer_id: users[2].id },
    { artwork_id: artworks[4].id, viewer_id: users[4].id },
    { artwork_id: artworks[5].id, viewer_id: users[4].id },
    { artwork_id: artworks[5].id, viewer_id: users[5].id },
    { artwork_id: artworks[6].id, viewer_id: users[5].id }
  ])