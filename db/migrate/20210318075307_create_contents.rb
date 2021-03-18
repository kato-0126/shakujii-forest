class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.text :explain,null: false
      t.integer :fav
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
