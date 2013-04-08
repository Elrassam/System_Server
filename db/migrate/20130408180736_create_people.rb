class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :password
      t.boolean :type
      t.string :email

      t.timestamps
    end
  end
end
