# module ParkDiscovery
class CLI

    def initialize
        APIGet.new("https://developer.nps.gov/api/v1/parks?stateCode=NC&api_key=#{ENV["NPS_API_KEY"]}").get_response_body
    end

    def begin
        puts "Hello! Welcome to NC Park Discovery!".blue
        sleep(2)
        puts "This program allows you to search through North Carolina's National Parks to find the ideal park or national monument for you!".blue
        sleep(5)
        puts "Select exit when you are done using NC Park Discovery. Enjoy!".blue
        sleep(3)
        main_menu_prompt
    end

    def case_block(main_input)
        case main_input
        when 1 
            park_input = list_parks
            chosen_park = Park.find_by_name(park_input)
            sleep(2)
            puts "Name:".cyan
            puts "#{chosen_park.name}"
            sleep(2)
            puts "Description:".cyan
            puts "#{chosen_park.description}"
            sleep(2)
            puts "Available Activities:".cyan
            puts "#{chosen_park.activity.join(", ")}"
            sleep(2)
            puts "Link for more information:".cyan
            puts "#{chosen_park.url}"
            sleep(2)
            puts "Make another selection or choose Exit:".light_magenta
            sleep(3)
            main_input = main_menu_prompt

        when 2
            activity_input = list_activities
            chosen_activity_park = Park.find_by_activity(activity_input)
            puts "#{chosen_activity_park.name}".cyan
            sleep(1)
            puts "Make another selection or choose Exit:".light_magenta
            sleep(1)
            main_input = main_menu_prompt
        when 3
            goodbye
            sleep(3)
            exit
        end
        
    end

    def prompt
        prompt = TTY::Prompt.new
    end

    def main_menu_prompt
        
        input = prompt.select("Search by Park or by Activity", cycle: true) do |menu|
            menu.choice "List all parks", 1
            menu.choice "List all activities", 2
            menu.choice "Exit", 3
        end
        case_block(input)
    end


    def list_parks
        parks = Park.all
        park_names = parks.collect do |park|
            park.name
        end
        
        prompt.select("Please select from these parks:", park_names.uniq)
    end

    def list_activities
        activities = Activity.all
        park_activities = activities.collect do |activity|
            activity.name
        end

        prompt.select("These are some of the activities available in NC National Parks:", park_activities.uniq)
    end

    def goodbye
        puts "Thank you for using Park Discovery! Goodbye!".light_magenta
    end

end
# end