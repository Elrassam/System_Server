class Renamereservation < ActiveRecord::Migration
  def change
  	rename_column(:reservations, :from, :datefrom)
  	rename_column(:reservations, :to, :dateto)
  end
end
