class CreateDogowners < ActiveRecord::Migration
  def up
    create_table :dogowners do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end

  def down
    drop_table :dogowners
  end
end
