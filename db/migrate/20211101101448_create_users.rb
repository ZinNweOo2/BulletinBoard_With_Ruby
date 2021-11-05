class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :integer do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.string :password_digest, null: false
      t.string :profile, null: false
      t.string :type, :limit => 1, null: false
      t.string :phone, :limit => 20
      t.string :address
      t.date :dob
      t.integer :create_user_id, null: false
      t.integer :updated_user_id, null: false
      t.integer :deleted_user_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
