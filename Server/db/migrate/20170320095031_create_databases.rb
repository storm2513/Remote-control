class CreateDatabases < ActiveRecord::Migration[5.0]
  def change
    create_table :databases do |t|
      t.integer :UID
      t.string :secret

      t.timestamps
    end
  end
end
