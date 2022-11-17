class AddAddressToDoppelganger < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgangers, :address, :string
  end
end
