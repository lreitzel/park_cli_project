# module ParkDiscovery
class CLI

    def initialize
        APIGet.new("https://developer.nps.gov/api/v1/parks?stateCode=NC&api_key=#{ENV["NPS_API_KEY"]}").get_response_body
        # APIGet.new("https://developer.nps.gov/api/v1/parks?&api_key=#{ENV["NPS_API_KEY"]}").get_response_body
        # binding.pry
    end

    def begin
        puts "Hello! Welcome to  NC Park Discovery!"
        # sleep(2)
        puts "This program allows you to search through North Carolina's National Parks to find the ideal park or national monument for you!"
        # sleep(5)
        # puts "Please select the state you want to explore in:"
        # sleep(2)
        puts "Select exit if you are done with NC Park Discovery."
        # sleep(3)
        # regions_prompt
        # input = ""
        main_input = main_menu_prompt

        case main_input
        when 1 
            park_input = list_parks
            chosen_park = Park.find_by_name(park_input)
            puts "Name: #{chosen_park.name}" #create method using chosen_park as argument with better formatting
            puts "Description: #{chosen_park.description}"
            puts "Available Activities: #{chosen_park.activity}"
            puts "Press any key to return to main menu"
            input = gets.strip
            main_menu_prompt

        when 2
            list_activities
        when 3
            goodbye
            exit
        else
            "Sorry, that is not a valid option, please select from the list"
        end
        
    end

    def prompt
        prompt = TTY::Prompt.new
    end

    def main_menu_prompt
        prompt.select("Search by Park or by Activity", cycle: true) do |menu|
            menu.choice "List all parks", 1
            menu.choice "List all activities and then select a park", 2
            menu.choice "Exit", 3
        end
    end

    def list_parks
        parks = Park.all
        park_names = parks.collect do |park|
            park.name
        end
        
        prompt.select("Please select from these parks:", park_names.uniq, cycle: true) do |menu|
            menu.choice "Return to main menu"
            menu.choice "Exit"
        end
    end

    # def state_prompt
    #     @states = state_menu
    #     prompt.select("State Options", @states)
    # end

    # def regions_prompt
        
    #     prompt.select("Region Options") do |menu|
    #         menu.choice "Alaska", 1
    #         menu.choice "Intermountain", 2
    #         menu.choice "Midwest", 3
    #         menu.choice "National Capital", 4
    #         menu.choice "Northeast", 5
    #         menu.choice "Southeast", 6
    #         menu.choice "Pacific West", 7
    #         menu.choice "Exit Park Discovery", 8
    #     end
    # end

    # def list_parks_by_state
    #     input = gets.strip

    #     if state = State.find_state_by_name(input)
    #         state.parks.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |park, i|
    #             puts "#{i}. #{park.name}"
    #         end
    #     end
    # end

    # def state_menu
    #     puts "Please select the state in which you would like to explore:"
    
    #     State.all.sort {|a, b| a.name <=> b.name}.collect {|state| state.name}
    #         #puts "#{i}. #{state.name}"
    #     #end
    #     #need to figure out how to get this method to list names, not objects.
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

end
# end