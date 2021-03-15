class Activity
    attr_accessor :name

    @@all =[]

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end