class CreateAllDb < ActiveRecord::Migration
	def up
	  create_table :people do |t|
		  t.string :username
		  t.string :password
		  t.boolean :person_type
		  t.string :email

		  t.timestamps
	  end
    
  	create_table :places do |t|
      t.string :placename
      t.string :building
      t.integer :size
      t.integer :person_id

      t.timestamps
    end
    
    create_table :capabilities do |t|
      t.string :cap_name

      t.timestamps
    end
    
    create_table :reservations do |t|
      t.integer :place_id
      t.date :datefrom
      t.date :dateto
      t.string :dayname
      t.integer :period
      t.text :purpose

      t.timestamps
    end
    
    create_table :capabilities_places do |t|
      t.integer :capability_id
      t.integer :place_id

      t.timestamps
    end
    
    add_index(:places, :size, :name => "size_index")
    add_index(:places, [:placename, :building], :name => "build_pname_index")
    add_index(:people, [:username, :password], :name => "usrnm_pswrd_index")
  end
  
  def down
  	drop_table :places
  	drop_table :people
  	drop_table :capabilities
  	drop_table :reservations
  	drop_table :capabilities_places
  end
end
