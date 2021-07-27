class RenameColumnAndConnectAdminToReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :type, :string
    add_column :reports, :report_type, :string
  end
end
