require 'nokogiri'
require 'open-uri'
require 'pry'

# Fetch and parse HTML document
# Creates/writes .txt documents 

class Document
	@find = ['nav ul.menu li a', 'article h2'] # why it doesn't working???
	@say = '=============links&headers============='

	def self.parse
		# $stdout = File.open("#{@say}.txt", 'a')
		doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))
			
    puts @say
    if @find.is_a?(Array)
      @find.each do |find|
        puts_links_by(doc, find)
      end
    else
      puts_links_by(doc, @find)
    end
	end

  def self.puts_links_by(doc, request)
    doc.css(request).each do |link|
      puts link.content
    end
  end
end

class Link < Document
	@find = 'nav ul.menu li a'
	@say = '=============links============='
end

class Header < Document
	@find = 'h2'
	@say = '=============headers============='
end

p Document.parse
p Header.parse
p Link.parse