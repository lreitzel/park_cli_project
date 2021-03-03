# module ParkDiscovery
class Park
    attr_accessor :name, :description, :activity, :state, :url

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

    # def state
    #     new_state = State.new(name)
    #     new_state.parks
    # end

    def self.find_by_name(name)
        @@all.find {|park| park.name == name}
    end

    def self.find_by_activity(activity)
        @@all.select do |park|
            if park.activity.include?(activity)
                park.name
            end
        end
            
    end

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