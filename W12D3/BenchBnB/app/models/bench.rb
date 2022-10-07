# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  price       :integer          not null
#  seating     :integer          default(2), not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not nulljson.extract! @bench :id, :title, :description, :price, :seating, :lat, :lng
#
class Bench < ApplicationRecord

    validates :title, :description, :price, :seating, :lat, :lng, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }

end
