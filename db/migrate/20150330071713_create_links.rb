class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.timestamps null: false
      t.string :url
      t.text :title, limit: 500
      t.text :about, limit: 1000
      t.references :user, index: true, foreign_key: true
    end
  end
end
