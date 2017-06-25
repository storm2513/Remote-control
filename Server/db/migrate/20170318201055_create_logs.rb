class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :text
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
