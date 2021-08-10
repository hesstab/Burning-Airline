class Airplane < ApplicationRecord
   has_many :flights
   has_many :reservations, :through => :flights
   has_many :reservations, :through => :users
end
