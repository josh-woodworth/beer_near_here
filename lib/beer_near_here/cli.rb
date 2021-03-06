require 'colorize'

class CLI

  def welcome
    puts ""
    puts ""
    puts "Hello, Welcome to".green + " B".blue + "eer-".green + "N".blue + "ear-".green + "H".blue + "ere".green
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " _____    _     _   _    _   _   _ ".blue
        puts "|      \\ | \\   | | | |  | | | | | |".blue                    
        puts "|  ()   )|  \\  | | | |  | | | | | |".blue
        puts "|      / |   \\ | | | |__| | | | | |".blue
        puts "|     (  |    \\| | |  __  | | | | |".blue
        puts "|  ()  \\ |  |\\   | | |  | | |_| |_|".blue
        puts "|       )|  | \\  | | |  | |  _   _".blue
        puts "|______/ |__|  \\_| |_|  |_| |_| |_|".blue
        puts ""
    prompt_city
    # prompt
    input = gets.strip.downcase
    while input != 'done' do
      if input == 'list'
        list_breweries(City.find_by_city(@city).breweries)
      elsif input.to_i > 0 && input.to_i <= City.find_by_city(@city).breweries.length
        brewery = City.find_by_city(@city).breweries[input.to_i - 1]
          API.get_brewery_details(brewery)
          print_brewery(brewery)
          prompt
      elsif input == 'return'
        prompt_city
      else
        puts ""
        puts "*Option is not available, please select from choices below*".red
        puts ""
        prompt
      end
      input = gets.strip.downcase
      # prompt
    end
    puts ""
    puts "Go Enjoy Some Beers!!!".blue
    puts ""
  end

  def prompt_city
    puts ""
    puts "Find a local brewery by entering a City name below".green
    puts ""
    @city = gets.strip.downcase
    API.fetch_brewery(@city)
    breweries = City.find_by_city(@city).breweries
    list_breweries(breweries)
  end

  def list_breweries(breweries)
    puts ""
    puts "Here are the breweries in".blue + " #{@city.capitalize}:".light_blue
    puts "------------------------------"
    # puts "enter a number listed to see details of that Brewery".green
    # puts ""
    breweries.each.with_index(1) do | b, i |
    puts "#{i}. #{b.name}"
    end
    puts ""
    puts "enter a number listed to see details of that Brewery".green
    puts ""
    puts "------------------------"
    puts ""
  end

  def print_brewery(brewery)
    puts ""
    puts "#{brewery.name}".upcase.blue
    puts "-----------------------"
    puts "#{brewery.address}".green 
    puts "#{brewery.city.capitalize}".green + ", #{brewery.state}".green
    puts "#{brewery.postal}".green
    if brewery.phone_number.empty?
      puts "Sorry, No Number"
    else
    puts "#{brewery.phone_number}".insert(3, '-').insert(7, '-')
    end
    if brewery.website_url.empty?
      puts "Sorry, No Website"
    else
    puts "#{brewery.website_url}".magenta
    end
    puts ""
  end
  
  def prompt
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "type".blue + " 'list'".green + " to view previous city brewery list".blue
    puts "type".blue + " 'return'".green + " to input another city".blue
    puts "type".blue + " 'done'".light_red + " when you're finished".blue
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end
end
