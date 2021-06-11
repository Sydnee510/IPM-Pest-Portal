class Location < ApplicationRecord
    has_many :work_orders
    has_many :users, through: :work_orders
    
    validates :name, presence: true
    validates :city, presence: true

end
