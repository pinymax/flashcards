require "rubygems"
require "nokogiri"
require "open-uri"

url = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
doc = Nokogiri::HTML(open(url))
origin = doc.css(".bigLetter")
transl = doc.css(".bigLetter+ td")

origin.each_with_index do |val, index|
  Card.create({"original_text" => "#{val.text}", "translated_text" => "#{transl[index].text}", "user_id" => User.last.id })
end
