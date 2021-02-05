# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :age
      t.references :role, null: false, foreign_key: true
      t.string :address
      t.integer :contact
      t.string :token

      t.timestamps
    end
  end
end
