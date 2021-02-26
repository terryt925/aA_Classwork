class User < ApplicationRecord

validates :username, uniqueness:true, presence:true

has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork

has_many :shared_views,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare

has_many :shared_artworks,
  through: :shared_views,
  source: :artwork

end
