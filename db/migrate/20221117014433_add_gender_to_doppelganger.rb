class AddGenderToDoppelganger < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgangers, :gender, :integer, default: 0
  end
end
