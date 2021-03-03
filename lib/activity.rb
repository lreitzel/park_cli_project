# module ParkDiscovery
class Activity
    attr_accessor :name

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
    
end
# end