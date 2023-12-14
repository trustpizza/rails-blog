class AddPositionToPostElement < ActiveRecord::Migration[7.1]
  def change
    PostElement.order(:updated_at).each.with_index(1) do |post_element, index|
      post_element.update_column :position, index
    end
  end
end
