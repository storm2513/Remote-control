json.extract! device, :id, :user_id, :name, :UID, :status, :active, :created_at, :updated_at
json.url device_url(device, format: :json)
