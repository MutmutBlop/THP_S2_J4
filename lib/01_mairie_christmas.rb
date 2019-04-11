require 'nokogiri'
require 'open-uri'

# Méthode qui scrappe les urls de chaque ville du Val d'Oise et les met dans un array
def get_townhall_urls

  townhall_url = "http://annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(open(townhall_url))

  return townhall_urls_array = page.xpath('//p/a/@href').map {|x| x.to_s.reverse.chop.reverse}
  #puts townhall_urls_array
  #townhall_urls_array

end
get_townhall_urls

# Méthode qui scrappe l'email sur la page de la ville et la met dans un array
def get_townhall_emails(townhall_urls_array)

# BOUCLE ICI : each do en appelant townhall_urls_array pour parcourir chaque url de ville et aller chercher son email

  townhall_urls_array.each do |url|

# ICI : insérer variable dans l'url de la ville
  townhall_url = "https://www.annuaire-des-mairies.com#{url}"
  page = Nokogiri::HTML(open(townhall_url))
  puts townhall_url

  townhall_emails_array = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()').map {|x| x.to_s}
  #return townhall_emails_array

# Résultat de la boucle : un array avec tous les emails

end
get_townhall_emails(townhall_urls_array)

return townhall_emails_array
puts townhall_emails_array

end

# ICI : perform
# - fait tourner la boucle qui crée un array avec tous les emails
# - transforme l'url en nom de ville
# - combine les deux arrays pour créer un array de hashes > result = Hash.new { |hash, key| hash[key] =  }

# def perform
# get_townhall_emails(townhall_urls_array) # fait tourner la boucle qui crée un array avec tous les emails
# # - transforme l'url en nom de ville
# result = Hash[townhall_emails_array.zip(townhall_urls_array)] # combine les deux arrays pour créer un array de hashes
# puts result
# end
# perform

# def boucle
#   - va dans l'url d'une ville
#   - prend son email
#   - le met dans un hash
