
require 'pry'
require 'net/http'

class API

    def self.fetch_brewery(city)
      url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      breweries = JSON.parse(response)
      new_city = City.new(city) 
      breweries.each do |x| new_brewery = Brewery.new(name: x["name"], id: x["id"], city: city) 
      new_city.breweries << new_brewery 
      end
    end
  
    def self.get_brewery_details(brewery)
      url = "https://api.openbrewerydb.org/breweries/#{brewery.id}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      brew = JSON.parse(response)
      brewery.type = brew["brewery_type"]
      brewery.address = brew["street"]
      brewery.state = brew["state"]
      brewery.postal = brew["postal_code"]
      brewery.phone_number = (brew["phone"])
      brewery.website_url = brew["website_url"]
    end
end
 