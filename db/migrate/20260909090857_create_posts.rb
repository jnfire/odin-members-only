class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
