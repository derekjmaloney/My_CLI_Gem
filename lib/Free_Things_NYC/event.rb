class FreeNYC
  class Event
attr_accessor :name, :location, :availability, :url
    def self.today
      #Should return instances of today's events
      puts <<-DOC
      1. Shakespeare in park. Central Park. A great free assortment of plays and shows.  Available until 12/12/2020.
      2. Fireworks show on East River.  East River Park. Fun fireworks display. Available until 11/11/2030.
      DOC

      event_1 = self.new
      event_1.name = "Shakespeare in park"
      event_1.location = "Central Park"
      event_1.availability = "12/12/2020"
      event_1.url = "facebook.com" #this will be the read more link

      event_2 = self.new
      event_2.name = "Fireworks show on East River"
      event_2.location = "East River Park"
      event_2.availability = "11/11/2030"
      event_2.url = "yahoo.com" #this will be the read more link

      [event_1, event_2] #we're gonna return the event instances
    end











    #closes classes out
  end
end
