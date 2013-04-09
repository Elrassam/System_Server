class RenamePlacenameColumn < ActiveRecord::Migration
  def change
  	rename_column(:places, :p_name, :placename)
  end
end
