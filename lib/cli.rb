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
            activity_input = list_activities
            chosen_activity = Park.find_by_activity(activity_input).each.with_index(1) do |park, i|
                puts "#{i}. #{park.name}" 
            end
            puts "Press any key to return to main menu"
            input = gets.strip
            main_menu_prompt

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

    def list_activities
        activities = Activity.all
        park_activities = activities.collect do |activity|
            activity.name
        end

        prompt.select("Please select from these activities:", park_activities.uniq, cycle: true) do |menu|
            menu.choice "Return to main menu"
            menu.choice "Exit"
        end
    end

    def goodbye
       puts "Thank you for using Park Discovery! Goodbye!"
    end

end
# end