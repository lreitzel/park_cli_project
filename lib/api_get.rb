class ParkDiscovery::APIGet
    attr_accessor :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = NET::HTTP.get_response(uri)
        parse_json(response.body)
    end

    def parse_json(api_data)
        info = JSON.parse(api_data)
        binding.pry
        info["data"].each do |hash|
            hash["fullName"]
            hash["description"]
            hash["addresses"]
            hash["activities"]
        end

    end

end