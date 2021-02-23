class AddImageIdToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :image_id, :string
  end
end
