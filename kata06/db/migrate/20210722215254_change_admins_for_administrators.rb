# frozen_string_literal: true

class ChangeAdminsForAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :administrator, index: true
    add_foreign_key :reports, :administrators
  end
end
