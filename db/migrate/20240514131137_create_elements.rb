class CreateElements < ActiveRecord::Migration[7.1]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.references :post, null: false, foreign_key: {on_delete: :cascade}
      t.integer :position

      t.timestamps
    end
  end
end
