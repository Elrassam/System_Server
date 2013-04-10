class AddColumnDaynameToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :daydate, :date
  end
end
