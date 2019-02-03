class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.text :author
      t.datetime :published_at
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :comments, :author
  end
end
