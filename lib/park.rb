class Park
    attr_accessor :name, :description, :activities, :url

    @@all = []

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
        parks = @@all.collect do |park|
            if park.activities.include?(activity)
                park.name
            end
        end
        parks.compact
    end
end