
class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :longitude
      t.float :latitude

      t.references :locationable, :polymorphic => true

      t.timestamps
    end 
  end
end
