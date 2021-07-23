class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :type
      t.string :date
      t.string :description

      t.timestamps
    end
  end
end
