# extract fields from static html with results of voting
# convert to something like js array


require 'nokogiri'
require 'open-uri'


# our file with html
doc = Nokogiri::HTML(open('voting_final.html'))


doc.css('[class*="container-"]').each do |cont| # this is interesting: selector [class*="container-"] selects all elements with class like container-1, container-2, ... container-x
  cont_class =  cont["class"]
  h3 = cont.css("h3").inner_html.strip
  date = cont.css("div.date").text.strip
  rec1 = cont.css("div.rectangle-1").text.strip
  rec2 = cont.css("div.rectangle-2").text.strip
  img = cont.css("img")[0]["src"]
  puts "['#{cont_class}', '#{h3}', '#{date}', '#{rec1}', '#{rec2}', '#{img}'],"

end
