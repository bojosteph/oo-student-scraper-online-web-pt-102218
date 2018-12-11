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
    students_hash = {}
    html = Nokogiri::HTML(open(profile_url))
    html.css("div.social_icon_controller a").each do |student|
      url = student.attribute("href")
        students_hash[:twitter_url] = url if url.include?("twitter")
        students_hash[:linkedin_url] = url if url.include?("linkedin")
        students_hash[:github_url] = url if url.include?("github")
        students_hash[:blog_url] = url if student.css("img").attribute("src").text.include?("rss")
    end
        students_hash[:profile_quote] = html.css("div.profile-quote").text
        students_hash[:bio] = html.css("div.bio-content p").text
    students_hash
  end
end


