require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
doc = Nokogiri::HTML(open(url))
doc.css(".bigLetter").each do |word|
  Card.create({"original_text" => "#{word.text}"})
end
