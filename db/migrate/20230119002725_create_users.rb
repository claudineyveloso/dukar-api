# frozen_string_literal: true

# Class Create User
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false, default: ''
      t.string :username, limit: 100, null: false, default: ''
      t.string :email, limit: 100, null: false, default: ''
      t.boolean :is_active, null: false, default: true
      t.string :password_digest
      t.timestamps
    end
  end
end
