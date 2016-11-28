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
    puts "Welcome. Here are 3 free things to do in NYC today!"
    # puts <<-DOC
    # 1. Shakespeare in park. Central Park. A great free assortment of plays and shows.  Available until 12/12/2020.
    # 2. Fireworks show on East River.  East River Park. Fun fireworks display. Available until 11/11/2030.
    # DOC
    @events_array = FreeNYC::Event.today
    @events_array.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} \n -#{event.location}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the event you'd like more info on. Alternatively, type list to see the list again, or type exit to exit"
    input = gets.strip.downcase
    #
      if input.to_i > 0
        given_event = @events_array[input.to_i - 1]
        puts  "#{given_event.name} \n - #{given_event.description} \n - Located at #{given_event.location} \n - This free event is available #{given_event.availability} \n - Visit here for more info: #{given_event.url}"


        #puts "Are you interested in this event? If so, type SOMETHING to be brought to the full event page for details and all information"
      elsif input == "list"
        list_events
      else
        puts "Not sure what you're looking for. Please type list or exit" unless input == "exit"
      end
    #
    end
  end

  def goodbye
    puts "Goodbye, check in again tomorrow for new things to do :) "
  end




#class closes
  end
end
