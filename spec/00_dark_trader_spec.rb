require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

page = Nokogiri::HTML(open(PAGE_URL))

# puts page.css("title")[0].name   # => title
# puts page.css("title")[0].text   # => My webpage
#
# links = page.css("a")
# puts links.length   # => 6
# puts links[0].text   # => Click here
# puts links[0]["href"] # => http://www.google.com

news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Array
