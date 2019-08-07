json.extract! notification, :id, :name, :description, :target, :level, :created_at, :updated_at
json.url notification_url(notification, format: :json)
