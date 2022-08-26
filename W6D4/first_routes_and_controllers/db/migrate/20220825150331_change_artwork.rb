class ChangeArtwork < ActiveRecord::Migration[7.0]
  def change
    change_table :artworks do |t|
      t.remove :artist_id_id
      t.references :artist, null: false, foreign_key: {to_table: :users}
    end
  end
end
