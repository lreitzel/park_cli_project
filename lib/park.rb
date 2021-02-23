class Park
    attr_accessor :name, :description, :location, :activity

    @@all = []

    def initialize(name)
        @name = fullName
        @description = description
        @location = addresses
        @activity = activities
    end

    def self.all
        @@all 
    end

end