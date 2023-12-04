class CreatePostElements < ActiveRecord::Migration[7.1]
  def change
    create_table :post_elements do |t|
      t.string :element_type
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
