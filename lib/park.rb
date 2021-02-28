# module ParkDiscovery
class Park
    attr_accessor :name, :description, :activity, :state

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

    #{region: ["different states"]}

    # def self.region
    #     if self.state == "AK"
    #         self.region = "Alaska"
    #     elsif self.state == "MT" || "WY" || "UT" || "CO" || "AZ" || "NM" || "TX" || "OK"
    #         self.region = "Intermountain"
    #     elsif self.state == "ND" || "SD" || "NE" || "KS" || "AR" || "MO" || "IA" || "MN" || "WI" || "MI" || "IL" || "IN" || "OH"
    #         self.region = "Midwest"
    #     elsif self.state == "DC"
    #         self.region = "National Capital"
    #     elsif self.state == "WV" || "VA" || "MD" || "DE" || "PA" || "NJ" || "NY" || "CT" || "RI" || "MA" || "VT" || "NH" || "ME"
    #         self.region = "Northeast"
    #     elsif self.state == "KY" || "TN" || "NC" || "SC" || "GA" || "FL" || "AL" || "MS" || "LA"
    #         self.region = "Southeast"
    #     elsif self.state == "HI" || "CA" || "WA" || "NV" || "OR" || "ID"
    #         self.region = "Pacific West"
    #     end
    #     binding.pry
    # end

    # def state
    #     new_state = State.new(name)
    #     new_state.parks
    # end

    def self.find_by_name(name)
        @@all.find {|park| park.name == name}
    end

    # def self.find_by_activity(activity)
    #     @@all.find {|park| park.activity == activity}
    # end

    def self.find_by_state(state)
        @@all.find {|park| park.state(name) == state(name)}
    end

    # def self.states
    #     self.all.select {|state| state.park == self} #don't even know if these two methods are helpful or neccessary
    #     @states
    # end

    # def add_state(state)
    #     state.park = self unless state.park
    #     @states << state unless @states.include?(state)
    # end

end
# end