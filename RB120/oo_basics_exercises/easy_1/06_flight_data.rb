class Flight
  #attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# don't give unnecessary access to critical variables.
# if their usage down the line becomes embedded in the 
# code... modifying the class becomes difficult or impossible.