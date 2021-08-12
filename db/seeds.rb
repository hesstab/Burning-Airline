

puts "Seeding Db..."

# CLEAR
User.destroy_all
Airplane.destroy_all
Flight.destroy_all
Reservation.destroy_all


# Tos and froms
@dest = [
    'Adelaide','Brisbane','Darwin','Gold Coast',
    'Melbourne','Perth','Sydney'
]

# FLIGHT NUMBERS
@flight_num = [
    'A392','B349','D354','G355','M444','P234',
    'S234','A645','B333','D555','G666','M464',
    'P364','S455',
]

# Function to create random date for flights, outputs as 'Mon Mar 08 21:11:56 -0800 2021'
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
u9 = User.create :email => 'roal@test.acc', :name => 'Roal', :password => 'chicken' #existing bookings
u10 = User.create :email => 'hoal@test.acc', :name => 'Hoäl', :password => 'chicken' #existing bookings
u11 = User.create :email => 'toal@test.acc', :name => 'Toal', :password => 'chicken' #existing bookings
puts "Seeded #{ User.count } users"

# MAKE PLANES
p1 = Airplane.create :name => '747 - 1', :capacity => 18
p2 = Airplane.create :name => '747 - 2', :capacity => 18
p3 = Airplane.create :name => '747 - 3', :capacity => 18
p4 = Airplane.create :name => 'a380 - 1', :capacity => 24
p5 = Airplane.create :name => 'a380 - 2', :capacity => 24
p6 = Airplane.create :name => 'Q400 - 1', :capacity => 4
p7 = Airplane.create :name => 'Q400 - 2', :capacity => 4
puts "Seeded #{ Airplane.count } planes"


# FLIGHTS - RESERVATION OBJECTS


@f1_seats = '{ a1: null,  a2:"Mai",  a3: null,  a4: null,  a5: null,  a6: null}, { b1: null,  b2: null,  b3: null,  b4: null,  b5: null,  b6: null}, { c1:"Pers",  c2:"Joe",  c3: null,  c4: null,  c5 :"Joel",  c6: null}'

@f2_seats = '{ a1: null,  a2:"Mai",  a3: null,  a4: null,  a5: null,  a6: null}, { b1: null,  b2: null,  b3: null,  b4: null,  b5: null,  b6: null}, { c1:"Pers",  c2:"Joe",  c3: null,  c4: null,  c5 :"Joel",  c6: null}'

@f3_seats = '{ a1: null,  a2:"Mai",  a3: null,  a4: null,  a5: null,  a6: null}, { b1: null,  b2: null,  b3: null,  b4: null,  b5: null,  b6: null}, { c1:"Pers",  c2:"Joe",  c3: null,  c4: null,  c5 :"Joel",  c6: null}'
 
@f4_seats = '{ a1: null,  a2:"Mai",  a3: null,  a4: null,  a5: null,  a6: null}, { b1: null,  b2: null,  b3: null,  b4: null,  b5: null,  b6: null}, { c1:"Pers",  c2:"Joe",  c3: null,  c4: null,  c5 :"Joel",  c6: null}'




# MAKE FLIGHTS AND ASSOCIATED RESERVATIONS

#flight with no reserv
f1 = Flight.create :flight_number => @flight_num[0], :origin => @dest[0], :destination => @dest[3], :depart_date => rand_date(), :seats_taken => 0, :reservation_obj => @f1_seats
p1.flights << f1


#flight with 4 reservations
f2 = Flight.create :flight_number => @flight_num[3], :origin => @dest[3], :destination => @dest[0], :depart_date => rand_date(), :seats_taken => 4, :reservation_obj => @f2_seats
p2.flights << f2

   r1 = Reservation.create :seat_number => 'a1'
   u3.reservations << r1
   f2.reservations << r1

   r2 = Reservation.create :seat_number => 'c1'
   u4.reservations << r2
   f2.reservations << r2

   r3 = Reservation.create :seat_number => 'c2'
   u5.reservations << r3
   f2.reservations << r3

   r4 = Reservation.create :seat_number => 'd4'
   u6.reservations << r4
   f2.reservations << r4


#flight with 1 reservation
f3 = Flight.create :flight_number => @flight_num[2], :origin => @dest[2], :destination => @dest[5], :depart_date => rand_date(), :seats_taken => 1, :reservation_obj => @f3_seats
p4.flights << f3

   r5 = Reservation.create :seat_number => 'b2'
   u7.reservations << r5
   f3.reservations << r5


#flight that is full with 4 reservations
f4 = Flight.create :flight_number => @flight_num[1], :origin => @dest[1], :destination => @dest[4], :depart_date => rand_date(), :seats_taken => 4, :reservation_obj => @f4_seats
p7.flights << f4

   r6 = Reservation.create :seat_number => 'a1'
   u8.reservations << r6
   f4.reservations << r6

   r7 = Reservation.create :seat_number => 'a2'
   u9.reservations << r7
   f4.reservations << r7

   r8 = Reservation.create :seat_number => 'b1'
   u10.reservations << r8
   f4.reservations << r8

   r9 = Reservation.create :seat_number => 'b2'
   u11.reservations << r9
   f4.reservations << r9


puts "Seeded #{ Flight.count } flights"
puts "Seeded #{ Reservation.count } reservations"

puts "It worked, maybe buy lotto tickets"
