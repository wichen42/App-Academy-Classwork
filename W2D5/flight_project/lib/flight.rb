class Flight

    attr_reader :passengers

    def initialize(flight_no, capacity)
        @flight_number = flight_no
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        @passengers << passenger if passenger.has_flight?(@flight_number) && !full?
    end

    def list_passengers
        @passengers.map {|passenger| passenger.name}
    end

    def [](idx)
        return @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end