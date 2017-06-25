class Log < ApplicationRecord
  belongs_to :user

  def self.make(text, id)
  	@log = Log.new
  	@log.user_id = id
  	@log.text = text
  	@log.save!
  end
end
