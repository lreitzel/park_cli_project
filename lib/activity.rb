# module ParkDiscovery
class Activity
    attr_accessor :name, :park

    @@all =[]

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|activity| activity.name == name}
    end

    def self.find_parks_with_activity(park)
        @@all.select do |activity|
            if activity.park.include?(park)
                activity.name
            end
        end
    end
    
end
# end