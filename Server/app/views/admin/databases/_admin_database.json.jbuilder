json.extract! database, :id, :UID, :secret, :created_at, :updated_at
json.url database_url(database, format: :json)
