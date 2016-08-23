class AddProfileReferenceToLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :profile, foreign_key: true
  end
end
