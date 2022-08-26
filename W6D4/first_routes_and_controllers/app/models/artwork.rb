# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_to_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_to_shares,
        source: :viewer

    def self.art_works_for_user_id(user_id)
        Artwork.select('artworks.*').joins(:shared_viewers).where(users: { id: user_id})
    end
end
