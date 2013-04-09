class CreatePlaceHasCaps < ActiveRecord::Migration
  def change
    create_table :place_has_caps do |t|
      t.integer :place_id
      t.integer :capability_id

      t.timestamps
    end
    drop_table :capabilities_places
  end
end
