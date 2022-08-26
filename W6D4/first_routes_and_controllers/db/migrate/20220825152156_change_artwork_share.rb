class ChangeArtworkShare < ActiveRecord::Migration[7.0]
  def change
    change_table :artwork_shares do |t|
      t.index [:artwork_id, :viewer_id], unique: true
    end
  end
end
