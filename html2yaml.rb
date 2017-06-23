#!/usr/bin/env ruby

require 'nokogiri'

filename = ARGV[0]

html = File.open(filename) { |f| Nokogiri::HTML(f) }

bible_text = html.css("#bibleText").to_s

text = bible_text
		.gsub(/<div.*?>/, "")
		.gsub(/<\/div>/, "")
		.gsub(/<a.*?>/, "")
		.gsub(/<\/a>/, "")
		.gsub(/<span.*?>/, "")
		.gsub(/<\/span>/, "")
		.gsub(/<u>/, "")
		.gsub(/<\/u>/, "")
		.gsub(/<sup.*?>/, "")
		.gsub(/<\/sup>/, "")
		.gsub(/\u00A0/, "")
		.gsub(/\*/, "")
		.gsub(/\+/, "")
		.gsub(/ /, "")
		.gsub(/^\s/, "")
		.gsub(/^[0-9]+/, "- ")

text << "\n"

last   = ""
output = ""

text.each_line { |line|
	if /^-/ =~ line
		output << last
	else
		output << last.chomp
	end

	last = line
}

print(output)
