class ShortenedUrl < ApplicationRecord

  validates :short_url, :long_url, uniqueness:true, presence:true 

  validates :user_id, presence:true

end
