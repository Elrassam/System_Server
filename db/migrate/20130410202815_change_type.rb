class ChangeType < ActiveRecord::Migration
  def change
  	drop_table :places
  	drop_table :people
  	drop_table :capabilities
  	drop_table :reservations
  	drop_table :capabilities_places
  end
end
