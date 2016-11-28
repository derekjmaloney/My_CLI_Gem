#Our CLI Controller; we use it to controll most of the CLI behavior

class FreeNYC
  class CLI


  def call

    list_events
    menu
    goodbye
  end

  def list_events
    #scrape etc get the headlines from the article
    puts "Welcome. Here are 5 free things to do in NYC today!"
    puts <<-DOC
    1. Shakespeare in park. Central Park. A great free assortment of plays and shows.  Available until 12/12/2020.
    2. Fireworks show on East River.  East River Park. Fun fireworks display. Available until 11/11/2030.
    DOC
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the deal you'd like more info on. Alternatively, type list to see the list again, or type exit to exit"
    input = gets.strip.downcase
      case input
      when "1"
        puts "More info on deal 1...." #this will return the first sentence of the event description, and offer to learn more; providing the link to the full event page via the "read more" button
        puts "Are you interested in this event? If so, type SOMETHING to be brought to the full event page for details and all information"
      when "2"
        puts "More info on deal 2...."
        puts "Are you interested in this event? If so, type SOMETHING to be brought to the full event page for details and all information"
      when "3"
        puts "more info on deal 3..."
        puts "Are you interested in this event? If so, type SOMETHING to be brought to the full event page for details and all information"
      when "list"
        list_events
      else
        puts "Not sure what you meant. Type 1-3, list, or exit"
      end
    end
  end

  def goodbye
    puts "Goodbye, check in again next week for new things to do :) "
  end




#class closes
  end
end
