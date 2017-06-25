class AddIdToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :UID, :int
    add_column :devices, :status, :int
    add_column :devices, :active, :int
  end
end
