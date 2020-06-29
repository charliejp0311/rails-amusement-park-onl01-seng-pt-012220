class Ride < ActiveRecord::Base
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction
end
