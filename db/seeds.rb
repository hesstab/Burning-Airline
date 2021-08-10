

puts "Seeding Db..."

# CLEAR
User.destroy_all
Airplane.destroy_all
Flight.destroy_all
Reservation.destroy_all

# toS (maybe we should create a db for this also?)
@dest = [
    'Adelaide','Brisbane','Darwin','Gold Coast',
    'Melbourne','Perth','Sydney'
]

# FLIGHT NUMBERS (maybe we should create a db for this also?)
@flight_num = [
    'A392','B349','D354','G355','M444','P234',
    'S234','A645','B333','D555','G666','M464',
    'P364','S455',
]

# TO DO: check if this is 'datetime'
# Function to create radom time for flights, outputs as 'Mon Mar 08 21:11:56 -0800 2021' for now, 
# but we can change once we decide what we want to get in the front end
def rand_date(from=2.days.from_now, to=10.days.from_now)
    Time.at(rand_in_range(from.to_f, to.to_f))
end
# helper for above method
def rand_in_range(from, to)
   rand * (to - from) + from
end


# MAKE USERS
u1 = User.create :email => 'sarah@test.acc', :name => 'Sarah', :password => 'chicken' #no bookings
u2 = User.create :email => 'harris@test.acc', :name => 'Harris', :password => 'chicken' #no bookings

u3 = User.create :email => 'mai@test.acc', :name => 'Mai', :password => 'chicken' #existing bookings
u4 = User.create :email => 'pers@test.acc', :name => 'Pers', :password => 'chicken' #existing bookings
u5 = User.create :email => 'joe@test.acc', :name => 'Joe', :password => 'chicken' #existing bookings
u6 = User.create :email => 'joel@test.acc', :name => 'Joel', :password => 'chicken' #existing bookings
u7 = User.create :email => 'smoel@test.acc', :name => 'Smoel', :password => 'chicken' #existing bookings
u8 = User.create :email => 'coal@test.acc', :name => 'Coal', :password => 'chicken' #existing bookings
puts "Seeded #{ User.count } users"

# PLANES
p1 = Airplane.create :name => '747 - 1', :capacity => 36 
p2 = Airplane.create :name => '747 - 2', :capacity => 36
p3 = Airplane.create :name => '747 - 3', :capacity => 36
p4 = Airplane.create :name => 'a380 - 1', :capacity => 45
p5 = Airplane.create :name => 'a380 - 2', :capacity => 45
p6 = Airplane.create :name => 'Q400 - 1', :capacity => 4
p7 = Airplane.create :name => 'Q400 - 2', :capacity => 4
puts "Seeded #{ Airplane.count } planes"


# FLIGHTS
#no reserv
f1 = Flight.create :flight_number => @flight_num[0], :from => @dest[0], :to => @dest[3], :depart_date => rand_date(), :seats_taken => 0 
p1.flights << f1

#some reserv
f2 = Flight.create :flight_number => @flight_num[3], :from => @dest[3], :to => @dest[0], :depart_date => rand_date(), :seats_taken => 1 
p2.flights << f2

#some reserv
f3 = Flight.create :flight_number => @flight_num[2], :from => @dest[2], :to => @dest[5], :depart_date => rand_date(), :seats_taken => 1 
p4.flights << f3

#full
f4 = Flight.create :flight_number => @flight_num[1], :from => @dest[1], :to => @dest[4], :depart_date => rand_date(), :seats_taken => 4
p7.flights << f4

puts "Seeded #{ Flight.count } flights"


# RESERVATIONS
# r1 = Reservation.create :seat_number => 'A1'
# u3.reservations << r1
# f2.reservations << r1

puts "Seeded #{ Reservation.count } reservations"





