class CreateFocusSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :focus_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.integer :duration_minutes
      t.datetime :completed_at

      t.timestamps
    end
  end
end
