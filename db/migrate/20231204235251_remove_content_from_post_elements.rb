class RemoveContentFromPostElements < ActiveRecord::Migration[7.1]
  def change
    remove_column :post_elements, :content
  end
end
