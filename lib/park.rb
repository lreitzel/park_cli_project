# module ParkDiscovery
class Park
    attr_accessor :name, :description, :state, :activity
    attr_reader :region

    @@all = []

    def initialize
       @@all << self
    end

    def self.all
        @@all 
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

    def self.find_by_name(name)
        @@all.find {|park| park.name == name}
    end

    def self.find_by_activity(activity)
        @@all.find {|park| park.activity == activity}
    end

    def self.find_by_state(state)
        @@all.find {|park| park.state == state}
    end

end
# end