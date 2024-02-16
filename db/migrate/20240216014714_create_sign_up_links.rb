class CreateSignUpLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :sign_up_links do |t|
      t.string :token
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
