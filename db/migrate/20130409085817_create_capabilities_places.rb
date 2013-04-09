class CreateCapabilitiesPlaces < ActiveRecord::Migration
  def change
    create_table :capabilities_places do |t|
      t.integer :capability_id
      t.integer :place_id

      t.timestamps
    end
    drop_table :place_has_caps
  end
end
