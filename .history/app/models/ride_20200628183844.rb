class Ride < ActiveRecord::Base
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction
    def take_ride
        user = self.user
        attraction = self.attraction
        if self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end
end
