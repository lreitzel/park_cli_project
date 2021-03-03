# module ParkDiscovery
class APIGet
    attr_accessor :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        parse_json(response.body)
    end

    def parse_json(body)
        info = JSON.parse(body)
        # binding.pry
        info["data"].each do |hash|
            new_park = Park.new
            new_park.name = hash["fullName"]
            new_park.description = hash["description"]
            new_park.activity = hash["activities"].collect {|h| h["name"]}
            # new_park.state = hash["addresses"].collect {|h| h["stateCode"]}[0]
            new_park.url = hash["url"]
            new_activity = Activity.new
            new_activity.name = hash["activities"].collect {|h| h["name"]}
            new_park.save
         
        end

    end

end
# end