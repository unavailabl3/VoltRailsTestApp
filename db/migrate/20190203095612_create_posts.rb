class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :author
      t.datetime :published_at
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :author
  end
end
