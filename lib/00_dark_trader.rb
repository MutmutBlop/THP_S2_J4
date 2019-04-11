require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(PAGE_URL))

crypto_names_array = page.xpath('//*[@class="text-left col-symbol"]/text()').map {|x| x.to_s}

crypto_rates_array = page.xpath('//*[@class="price"]/text()').map {|x| x.to_s}

result = Hash[crypto_names_array.zip(crypto_rates_array)]
puts result
