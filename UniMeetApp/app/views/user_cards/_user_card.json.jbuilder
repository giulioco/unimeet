json.extract! user_card, :id, :user_id, :created_at, :updated_at
json.url user_card_url(user_card, format: :json)
