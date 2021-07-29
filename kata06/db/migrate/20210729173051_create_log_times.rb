class CreateLogTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :log_times do |t|
      t.string :logtype
      t.timestamp :logdate
      t.timestamps
    end
  end
end
