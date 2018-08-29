module CoinMarketCap
class Initializator

    def self.populate_coins
       
        coins = CoinMarketCap::Coin.listing.select{|x| ['btc','xlm','eth'].include? x.symbol }
 
        coins.each do|cx|

           begin

           moneda_encontrada = Coin.where("symbol = ?", cx.symbol).first
           
           if moneda_encontrada.present?
               moneda_encontrada.coin_market_cap_id = cx.id
               moneda_encontrada.save
           end
           rescue
                 puts 'Ocurrio un error'
           end

        end

    end
end

end