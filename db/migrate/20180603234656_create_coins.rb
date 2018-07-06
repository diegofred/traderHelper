class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.integer :coin_market_cap_id
      t.integer :cryptomkt_id
      t.integer :binance_id

      t.timestamps
    end
  end
end
