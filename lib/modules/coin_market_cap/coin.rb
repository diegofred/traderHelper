module CoinMarketCap
  class Coin
    include HTTParty

    attr_accessor :id, :name, :symbol, :website_slug

    base_uri 'https://api.coinmarketcap.com/v2'

    def self.listing(params = nil)
  

      query_uri = '/listings?'
      query_uri = URI.parse(URI.escape(query_uri))
      response = get(query_uri)

      coins = []

      if response.success?
        response['data'].each do |ca|
            coins << parse_coin_listing(ca)
        end
      else
        # this just raises the net/http response that was raised
        ParametroPMU.instance.log_pmu.error('Ocurrio un error al buscar en pmu ' + response.response.to_s + ". query_uri = #{query_uri} ")
      end

      coins
end

    def self.parse_coin_listing(data)
      c = Coin.new
      c.id = data['id']
      c.name = data['name']
      c.symbol = data['symbol']
      c.website_slug = data['website_slug']
      c
    end
    end
end
