class CreateCliants < ActiveRecord::Migration
  def change
    create_table :cliants do |t|

      t.string :company_name, null: false
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :hashed_password

      t.boolean :suspended, null: false, default: false

      t.timestamps
    end

    add_index :cliants, :email_for_index, unique: true
    add_index :cliants, :company_name, unique: true
  end
end
