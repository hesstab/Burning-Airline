class Flight < ApplicationRecord
   belongs_to :airplane, :optional => true
end
