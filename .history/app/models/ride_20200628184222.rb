class Ride < ActiveRecord::Base
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction
    def take_ride
        user = self.user
        attraction = self.attraction
        if user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
    end
end
