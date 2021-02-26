# module ParkDiscovery
class CLI

    def initialize
        APIGet.new("https://developer.nps.gov/api/v1/parks?&api_key=#{ENV["NPS_API_KEY"]}").get_response_body
        # binding.pry
    end

    def begin
        puts "Hello! Welcome to Park Discovery!"
        sleep(2)
        puts "This program allows you to search through the state you're in or the state you want to explore to find the ideal park or national monument for you!"
        sleep(5)
        puts "Please select the region you want to explore in:"
        sleep(2)
        puts "Select exit if you are done with Park Discovery."
        sleep(3)
        regions_prompt
        input = ""
        while input != exit
            input = gets.strip.to_i

            case input
            when 1 #Alaska
                alaska_parks_prompt
            when 2 #Intermountain
                intermountain_region
            when 3 #midwest
                midwest_region
            when 4 #national capital
                capital_region
            when 5 #northeast
                northeast_region
            when 6 #southeast
                southeast_region
            when 7 #pacific west
                pacificwest_region
            when 8
                goodbye
                exit
            else
                "Sorry, that is not a valid region, please select from the list"
            end
        end
        
    
    end

    def prompt
        prompt = TTY::Prompt.new
    end

    def regions_prompt
        prompt.select("Region Options") do |menu|
            menu.choice "Alaska", 1
            menu.choice "Intermountain", 2
            menu.choice "Midwest", 3
            menu.choice "National Capital", 4
            menu.choice "Northeast", 5
            menu.choice "Southeast", 6
            menu.choice "Pacific West", 7
            menu.choice "Exit Park Discovery", 8
        end
    end

    def alaska_parks_prompt
        Park.find_by_state("AK")
    end
    # def state_menu need this to be a list of regions that list their states
    #     State.all.sort {|a, b| a.name <=> b.name}.each.with_index do |state, i|
    #         puts "#{i}. #{state.name}"
    #     end
    # end

    # def main_menu
    #     # puts "1. List all parks" #shows all parks, with a limit of 50
    #     # puts "2. List all activities" #then can select a specific park
    #     # puts "3. List all locations" #regions, then states, then parks in those states
    #     menu
    # end

    # def menu
    #     input = nil
    #     while input != "exit"
    #         input = gets.strip.to_i

    #         case input
    #         when 1
    #             list_parks #change to parks_menu method and create method that will show new list of parks 
    #             #and allow user to choose from that selection to get details.(park.name, park.location, park.activity)
    #         when 2
    #             list_activities #change to activities_menu method that will allow user to select an activity 
    #             #and see a list of parks that correspond to that activity.(list_parks_by_activity)
    #         when 3
    #             state_menu #change to states_menu that will allow people to see a list of states and then
    #             #select a state to see the list of parks.(list_parks_by_state)
    #         else
    #             puts "Please make a different selection, that option is invalid."
    #         end
    #     end

    # end

    def goodbye
       puts "Thank you for using Park Discovery! Goodbye!"
    end

    # def regions
    #     if Park.state == "AK"
    #         region = "Alaska"
    #     if Park.state == "MT" || "WY" || "UT" || "CO" || "AZ" || "NM" || "TX" || "OK"
    #         region = "Intermountain"
    #     if Park.state == "ND" || "SD" || "NE" || "KS" || "AR" || "MO" || "IA" || "MN" || "WI" || "MI" || "IL" || "IN" || "OH"
    #         region = "Midwest"
    #     if Park.state == "DC"
    #         region = "National Capital"
    #     if Park.state == "WV" || "VA" || "MD" || "DE" || "PA" || "NJ" || "NY" || "CT" || "RI" || "MA" || "VT" || "NH" || "ME"
    #         region = "Northeast"
    #     if Park.state == "KY" || "TN" || "NC" || "SC" || "GA" || "FL" || "AL" || "MS" || "LA"
    #         region = "Southeast"
    #     if Park.state == "HI" || "CA" || "WA" || "NV" || "OR" || "ID"
    #         region = "Pacific West"
    #     end
    #     # binding.pry
    #     Park.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |park, i|
    #         puts "#{i}. #{park.name}"
    #     end
    #     #then call another puts with another menu of options to select
    # end

    # def find_parks_by_state
    #     # Park.all.collect {|park| park.state == state}.each.with_index do |park, i|
    #     #     puts "#{i}. #{park.name}"
    #     # end
    # end

end
# end