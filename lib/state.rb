class State
    attr_accessor :name
    attr_reader :parks
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @parks = []
    end

    def self.all
        @@all
    end

    def self.parks
        self.all.select {|park| park.state == self}
        @parks
    end

    def add_park(park)
        park.state = self unless park.state
        @parks << park unless @parks.include?(park)
    end

    def self.find_state_by_name(name)
        @@all.find {|state| state.name == name}
    end

end