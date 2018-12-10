require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

      doc = Nokogiri::HTML(open(index_url))
      student_array = []

      doc.css(".student-card a").each do |student|

        hash = {name: student.css(".student-name").text,
          location: student.css("p.student-location").text,
          profile_url: student.attr("href")}
          student_array << hash
        end
        student_array
      end
 

  def self.scrape_profile_page(profile_url)
    student_hash = {}
    html = Nokogiri::HTML(open(profile_url))
    html.css("div.social_icon_controller a").each do |student|
      url = student.attribute("href")
      student_hash[:twitter_url] = url if url.include?("twitter")
      student_hash[:twitter_url] = url if url.include?("twitter")
      student_hash[:twitter_url] = url if url.include?("twitter")
      student_hash[:twitter_url] = url if url.include?("twitter")
  end

end


# :name html.css("h4.student-name").text
# :location html.css("p.student-location").text 
# url './fixtures/student-site/students/index.html'
# ("div.profile_quote").text
# ("div.bio-content p").text