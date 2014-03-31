class CreateDogs < ActiveRecord::Migration
  def up
    create_table :dogs do |t|
      t.integer :owner_id, null: false
      t.string :dog_name, null: false

      t.timestamps
    end
  end

  def down
    drop_table :dogs
  end
end
