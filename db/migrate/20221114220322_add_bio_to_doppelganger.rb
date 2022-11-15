class AddBioToDoppelganger < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgangers, :bio, :text
  end
end
