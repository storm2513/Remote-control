class AddDeviceToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :device, foreign_key: true
  end
end
