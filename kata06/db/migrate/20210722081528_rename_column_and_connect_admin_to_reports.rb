class RenameColumnAndConnectAdminToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :admin, index: true
    add_foreign_key :reports, :admins
    remove_column :reports, :type, :string
    add_column :reports, :report_type, :string
  end
end
