require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url="./fixtures/student-site/index.html")
    student_hash = {}
    html = Nokogiri::HTML(open(index_url))
    binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end


# :name html.css("h4.student-name").text
# :location html.css("p.student-location").text

