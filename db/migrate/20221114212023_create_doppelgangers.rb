class CreateDoppelgangers < ActiveRecord::Migration[7.0]
  def change
    create_table :doppelgangers do |t|
      t.string :name
      t.float :height
      t.string :location
      t.integer :age
      t.string :ethnicity
      t.integer :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
