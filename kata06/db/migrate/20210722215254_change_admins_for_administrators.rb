class ChangeAdminsForAdministrators < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reports, :admin, index: true
    
    add_reference :reports, :administrator, index: true
    add_foreign_key :reports, :administrators
    drop_table :admins
  end
end
