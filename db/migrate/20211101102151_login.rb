class Login < ActiveRecord::Migration[6.1]
  def change
    create_table :password_resets do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
