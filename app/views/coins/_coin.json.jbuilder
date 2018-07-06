json.extract! coin, :id, :name, :symbol, :coin_market_cap_id, :cryptomkt_id, :binance_id, :created_at, :updated_at
json.url coin_url(coin, format: :json)
