class Database < ApplicationRecord
  validates :secret, :UID, :presence => true
  validates_uniqueness_of :UID
end
