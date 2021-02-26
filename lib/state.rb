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

end