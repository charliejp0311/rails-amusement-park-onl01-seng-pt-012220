class Ride < ActiveRecord::Base
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    validates_with :enough_tickets  
    validates_with :tall_enough
    belongs_to :user
    belongs_to :attraction
    def take_ride
        
    end
    private
    def enough_tickets
        self.user.tickets > self.attraction.tickets ? true : " You do not have enough tickets to ride the #{self.attraction.name}."
    end
    def tall_enough
        self.user.height > self.attraction.min_height ? true : " You are not tall enough to ride the #{self.attraction.name}."
    end
end
