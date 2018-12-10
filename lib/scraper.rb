require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = "./fixtures/student-site/index.html"
    students_hash = []
    html = Nokogiri::HTML(open(index_url))
    html.css(".student-card").collect do |student|
      hash = {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/index.html/" + student.css("a").attribute("href")
      }
      students_hash << hash
    end
    students_hash
  end
 

  def self.scrape_profile_page(profile_url)
    
  end

end


# :name html.css("h4.student-name").text
# :location html.css("p.student-location").text
# url './fixtures/student-site/students/index.html'
# ("div.profile_quote").text
# ("div.bio-content p").text