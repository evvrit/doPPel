class RemoveLocationFromDoppelgangers < ActiveRecord::Migration[7.0]
  def change
    remove_column :doppelgangers, :location, :string
  end
end
