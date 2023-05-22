# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone_number, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :first_name
      t.string :last_name

      execute <<-SQL
        CREATE TYPE user_type_list AS ENUM ('Patient', 'Doctor');
      SQL

      t.column :type, :user_type_list, default: 'Patient'

      t.timestamps null: false
    end

    add_index :users, :phone_number,         unique: true
  end
end
