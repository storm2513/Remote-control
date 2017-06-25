class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.integer :UID
      t.integer :status
      t.integer :active

      t.timestamps
    end
  end
end
