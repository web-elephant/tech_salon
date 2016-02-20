class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|

      t.string :admin_name, null: false
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :hashed_password
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end

    add_index :admins, :email_for_index, unique: true
    add_index :admins, :admin_name, unique: true
  end
end
