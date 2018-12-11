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
    html = Nokogiri::HTML(open(profile_url))
    
    students_hash = {}
    html.css("div.social-icon-container a").each do |profile|
      case profile.attribute("href").value
      when /twitter/
        students_hash[:twitter] = profile.attribute("href").value
      when /github/
        students_hash[:github] = profile.attribute("href").value
      when /linkedin/
        students_hash[:linkedin] = profile.attribute("href").value
      else
          students_hash[:blog] = profile.attribute("href").value
      end
    end
    students_hash[:profile_quote] = html.css("div.profile-quote").text
    students_hash[:bio] = html.css("div.bio-content div.description-holder").text.strip
    students_hash
  end

end