class AddCoordinatesToDoppelgangers < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgangers, :latitude, :float
    add_column :doppelgangers, :longitude, :float
  end
end
