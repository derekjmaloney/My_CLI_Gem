require 'pry'

class FreeNYC
  class Event
attr_accessor :name, :location, :availability, :url, :description
    def self.today
      # Should return instances of today's events, or maybe instances of EventScraper..idk
      #so like:
      self.scrape_events
    end
    def self.scrape_events
      events = []
      doc = Nokogiri::HTML(open("https://www.timeout.com/newyork/things-to-do/free-things-to-do-today"))

      names = doc.css("div.tiles article.feature-item h3") #should be an array. u can call index and .text to read it out
      descriptions = doc.css("div.tiles article.feature-item p") #same
      locations = doc.css("div.tiles div.listings_flags span.icon_pin") #same
      availability = doc.css("div.tiles div.listings_flags span.icon_calendar") #take out "until" from beginning of each
      url = doc.search("div.feature-item__column h3 a")

      #go to TimeOut page on free things to do, scrape the first 3 ones listed
      #extract the properties
      #instantiate an event
      #finally, return an array of event instances
      event_1 = self.new
      event_1.name = names[0].text.strip
      event_1.location = locations[0].text.split(",")[1].delete("\n") unless locations[0].text.split(",")[1] == nil
      event_1.availability = availability[0].text.strip
      event_1.url =  "https://www.timeout.com" << url[0].attribute("href").value #this will be the read more link
      event_1.description = descriptions[0].text.strip

      event_2 = self.new
      event_2.name = names[1].text.strip
      event_2.location = locations[1].text.split(",")[1].delete("\n") unless locations[1].text.split(",")[1] == nil
      event_2.availability = availability[1].text.strip
      event_2.url =  "https://www.timeout.com" << url[1].attribute("href").value #this will be the read more link
      event_2.description = descriptions[1].text.strip

      event_3 = self.new
      event_3.name = names[2].text.strip
      event_3.location = locations[2].text.split(",")[1].delete("\n") unless locations[2].text.split(",")[1] == nil
      event_3.availability = availability[2].text.strip
      event_3.url =  "https://www.timeout.com" << url[2].attribute("href").value #this will be the read more link
      event_3.description = descriptions[2].text.strip


      events << event_1
      events << event_2
      events << event_3
      events #we're gonna return the event instances as an array; we use that as instance variable in CLI
    end
    #closes classes out
  end
end
