# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
