# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.boolean :is_active
      t.string :posicion
      t.integer :num_empleado
      t.integer :private_num

      t.timestamps
    end
  end
end
