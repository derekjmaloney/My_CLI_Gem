#Our CLI Controller; we use it to controll most of the CLI behavior

class FreeNYC
  class CLI

  def call
    list_events
    menu
    goodbye
  end

  def list_events
    puts "Welcome. Here are 3 free things to do in NYC today!"
    @events_array = FreeNYC::Event.today #performs scraping, attribute assignment, and returns an array of event instances
    @events_array.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} \n -#{event.location}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "\nEnter the number of the event you'd like more info on. Alternatively, type list to see the list again, or type exit to exit"
    input = gets.strip.downcase
      if input.to_i > 0
        given_event = @events_array[input.to_i - 1]
        puts  "\n #{given_event.name} \n\n - #{given_event.description} \n\n - Located at #{given_event.location} \n\n - This free event is available #{given_event.availability} \n\n - Visit here for more info: #{given_event.url} \n \n"
      elsif input == "list"
        list_events
      else
        puts "Not sure what you're looking for..." unless input == "exit"
      end
    end
  end

  def goodbye
    puts "\n\n Goodbye, check in again tomorrow for new things to do :) \n\n"
  end
#class closes
  end
end
