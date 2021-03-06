
class Brewery
    attr_accessor :name, :id, :city, :type, :address, :state, :postal, :country, :phone_number, :website_url
    @@all = []
  
      def initialize(name:, id:, city:)
        @name = name
        @id = id
        @city = city
        @@all << self
      end
  
      def self.all
        @@all
      end
  end 