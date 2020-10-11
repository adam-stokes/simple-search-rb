require 'simple/search'
require 'pry'
require 'json'

store = Simple::Search::Store.new
Simple::Search::QUOTES.each do |record|
  store.add(record)
end

query = ENV["SEARCHTERM"]

matches = store.search(query)

puts "## OUTPUT"
Pry::ColorPrinter.pp(matches.records)


puts
puts "## JSON"
puts JSON.pretty_generate(matches.records.collect { |i| { :id => i.id, :original_text => i.original_text, :text => i.text, :terms => i.terms, :frequency => i.term_frequency}})


puts
puts "## OUTPUT BY RANK"

matches = store.search_by_rank(query)
matches.each do |match|
  puts "ID: #{match[0].id}, Text: #{match[0].text}, Score: #{match[1]}"
end
