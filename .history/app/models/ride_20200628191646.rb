class Ride < ActiveRecord::Base
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction
    def take_ride
        user = self.user
        attraction = self.attraction
        message = "Sorry."
        if user.tickets < attraction.tickets
            message += " You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if user.height < attraction.min_height
            message += " You are not tall enough to ride the #{self.attraction.name}."
        end
        byebug
        if message == 'Sorry.'
            user.tickets -= attraction.tickets
            user.save
        else
            message
        end
    end
end
