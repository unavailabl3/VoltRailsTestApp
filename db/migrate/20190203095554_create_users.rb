class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password

      t.timestamps
    end
    add_index :users, :nickname
    add_index :users, :email
  end
end
