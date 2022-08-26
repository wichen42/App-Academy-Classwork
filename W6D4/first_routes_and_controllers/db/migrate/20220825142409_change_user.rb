class ChangeUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :email
      t.string :username, null: false, unique: true
    end

    #remove_column :users, :name
    #add_column :users, :username, :string, null: false, uniqueness: true
    #remove_column :users, :email 
  end
end
