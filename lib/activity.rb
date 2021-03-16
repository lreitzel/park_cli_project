class Activity
    attr_accessor :name

    @@all =[]

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.all_order
    #     all.sort {|a, b| a.name <=> b.name }

    #     self.all.sort_by {|a| a.name}
    # end
        
end

# code challenge: sort the list of activities alphabetically