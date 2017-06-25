class ValidateSecret < ActiveModel::Validator
  def validate(device)
    device_check = Database.find_by_UID(device.UID)
    if device_check.nil? || (device.secret != device_check.secret)
		device.errors[:base] << "Неправильный ID или Secret"
    end
  end
end

class Device < ApplicationRecord
  attr_accessor :skip_secret_validation
  belongs_to :user
  validates :name, :UID, :presence => true
  validates :secret, :presence => true, unless: :skip_secret_validation
  validates_uniqueness_of :UID
  validates_with ValidateSecret, unless: :skip_secret_validation
end