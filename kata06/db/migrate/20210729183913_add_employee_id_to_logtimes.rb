class AddEmployeeIdToLogtimes < ActiveRecord::Migration[6.1]
  def change
    add_reference :log_times, :employee, null: false, foreign_key: true
  end
end
