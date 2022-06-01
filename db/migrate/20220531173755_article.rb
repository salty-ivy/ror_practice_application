class Article < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :likes
      t.timestamps
    end
  end
end
