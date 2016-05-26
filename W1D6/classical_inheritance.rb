# Classical inheritance in Ruby

class Vehicle

  attr_reader :terrain, :propulsion

  def initialize(terrain, propulsion)
    @terrain = terrain
    @propulsion = propulsion
  end
end

steam_train = Vehicle.new('rails', 'steam')
puts steam_train.terrain
puts steam_train.propulsion
skateboard = Vehicle.new('road', 'manual')
puts skateboard.terrain
puts skateboard.propulsion

class Boat < Vehicle

  def initialize(propulsion)
    super('water', propulsion)
  end
end

# Should print out `Vehicle`.
puts Boat.superclass

# Should print out `Object`.
puts Vehicle.superclass

speed_boat = Boat.new('internal combustion')
puts speed_boat.terrain
puts speed_boat.propulsion

# Prints out details about the passed `vehicle` parameter. 
# Raises an ArgumentError if `vehicle` is not a `Vehicle`.
def display_vehicle(vehicle)

  # Raises an error if `vehicle.is_a?(Vehicle)` returns false. 
  # Note the use of capital "V" `Vehicle` here - the class object.
  raise ArgumentError, 'vehicle parameter must be a Vehicle' unless vehicle.is_a?(Vehicle)

  # Displays information about the passed `Vehicle`.
  puts "The vehicle can travel on #{vehicle.terrain} and is propelled by #{vehicle.propulsion}."
end

steam_boat = Boat.new('steam')
display_vehicle(steam_boat)

class SailBoat < Boat

  attr_reader :number_of_sails

  def initialize(number_of_sails)
    super('wind')
    @number_of_sails = number_of_sails
  end
end  

schooner = SailBoat.new(7)
puts schooner.terrain
puts schooner.propulsion
puts schooner.number_of_sails

class Bicycle < Vehicle

  def initialize(terrain)
    super(terrain, 'manual')
  end
end

class Fixie < Bicycle

  def initialize
    super('road')
  end
end

class MountainBike < Bicycle

  MAX_REAR_GEAR = 6
  MIN_REAR_GEAR = 1

  attr_reader :front_gear, :rear_gear
  
  attr_accessor :braking

  def initialize
    super('off road')
    @braking = false
    @front_gear = 1
    @rear_gear = 1
  end
  
  def gear
    (front_gear - 1) * MAX_REAR_GEAR + rear_gear
  end
  
  def stop
    self.braking = true
  end
  
  def increase_rear_gear
    @rear_gear += 1 if rear_gear < MAX_REAR_GEAR
  end
  
  def increase_rear_gear
    @rear_gear -= 1 if rear_gear > MIN_REAR_GEAR
  end
  
  def self.repair_kit
    ['wrench', 'pliers', 'pump']
  end
  
end
  
a_mountain_bike = MountainBike.new
puts a_mountain_bike.terrain
puts a_mountain_bike.propulsion
puts a_mountain_bike.braking

a_mountain_bike = MountainBike.new
a_mountain_bike.braking = true
puts a_mountain_bike.braking
puts a_mountain_bike.gear

puts a_mountain_bike.gear
a_mountain_bike.increase_rear_gear
puts a_mountain_bike.gear

puts MountainBike::MAX_REAR_GEAR
puts MountainBike.repair_kit

class Motorcycle < Vehicle
end

puts a_motorbike = Motorcycle.new('road', 'engine')
puts a_motorbike.terrain
puts a_motorbike.propulsion
