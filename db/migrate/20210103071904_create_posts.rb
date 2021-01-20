class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :matarial
      t.text :body
      t.text :comment

      t.timestamps
    end
  end
end
