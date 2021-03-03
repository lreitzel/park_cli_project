# module ParkDiscovery
class Park
    attr_accessor :name, :description, :activity, :url

    @@all = []

    def initialize
        save
    end

    def self.all
        @@all 
    end

    def save
        @@all << self
    end

    def self.find_by_name(name)
        @@all.find {|park| park.name == name}
    end

    def self.find_by_activity(activity)
        @@all.find do |park|
            if park.activity.include?(activity)
                park.name
            end
        end
            
    end

end
# end