class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :username
      t.string :email
      t.string :password_digest
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
