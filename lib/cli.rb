class ParkDiscovery::CLI

    def initialize
        APIGet.new("https://developer.nps.gov/api/v1/parks?&api_key=#{ENV["NPS_API_KEY"]}").get_response_body
        binding.pry
    end

    def begin
        puts "Hello! Welcome to Park Discovery!"
        sleep(1)
        puts "Please select from the menu which option you would like today."
        puts "Select exit if you are done with Park Discovery."
        menu
        goodbye
    end

    def menu
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "list parks"
                list_parks
            when "list activities"
                list_activities
            when "list regions"
                list_regions
            else
                "Please make a different selection, that option is invalid."
            end
        end
    end

    def goodbye
       puts "Thank you for using Park Discovery! Goodbye!"
    end

    def list_parks
        Park.all
    end



end