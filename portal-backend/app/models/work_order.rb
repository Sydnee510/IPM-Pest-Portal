class WorkOrder < ApplicationRecord
    belongs_to :location, optional: true
   belongs_to :user, optional: true
  
   validates :time, presence: true
  validates :duration, presence: true
   validates :price, presence: true
   validates :location, presence: true

   accepts_nested_attributes_for :location, reject_if: :all_blank
#    accepts_nested_attributes_for :user, redirect_if: :all_blank
  
   
end
