class AddSeedPhotoToDoppelganger < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgangers, :seed_photo, :string
  end
end
