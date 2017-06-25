class AddSecretToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :secret, :string
  end
end
