class CLI

    def initialize
        APIGet.new("https://developer.nps.gov/api/v1/parks?#{ENV["NPS_API_KEY"]}").get_response_body
        binding.pry
    end

    
end