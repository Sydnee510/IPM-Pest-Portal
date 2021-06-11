class Location < ApplicationRecord
    has_many :work_orders
    has_many :users, through: :work_orders
    
    validates :name, presence: true
    validates :city, presence: true

    def all_work_orders 
        self.work_orders.map do |work_order| 
        work_order.location
        end 
    end 
  

end
