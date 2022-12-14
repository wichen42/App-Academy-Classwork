# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks, 
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :user_to_shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :user_to_shares,
        source: :artwork
end
