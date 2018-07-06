module CoinMarketCap
class Ticker

    include HTTParty

    attr_accessor :id, :name, :symbol, :website_slug, :rank, :circulating_supply, :max_supply, :usd_price, :last_updated
    base_uri 'https://api.coinmarketcap.com/v2'




      def self.listing(params = nil)

        if params.nil?
            start = nil
            limit = nil
            sort = nil
            structure = nil
        else
            start = params['start']
            limit = params['limit']
            sort =  params['sort']
            structure = params['structure']
        end

        query_uri = '/listings?'
        query_uri = URI.parse(URI.escape(query_uri))
        response = get(query_uri)
  
        ticker = []
  
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
    # "id": 1, 
    # "name": "Bitcoin", 
    # "symbol": "BTC", 
    # "website_slug": "bitcoin", 
    # "rank": 1, 
    # "circulating_supply": 17008162.0, 
    # "total_supply": 17008162.0, 
    # "max_supply": 21000000.0, 
    # "quotes": {
    #     "USD": {
    #         "price": 9024.09, 
    #         "volume_24h": 8765400000.0, 
    #         "market_cap": 153483184623.0, 
    #         "percent_change_1h": -2.31, 
    #         "percent_change_24h": -4.18, 
    #         "percent_change_7d": -0.47
    #     }
    # }, 
    # "last_updated": 1525137271


end
end