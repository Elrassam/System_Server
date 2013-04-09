class CreateCapabilitiesPlaces < ActiveRecord::Migration
  def change
    create_table :capabilities_places do |t|
      t.integer :capability_id
      t.integer :place_id

      t.timestamps
    end
    
    rename_column(:people, :type, :person_type)
  end
end
