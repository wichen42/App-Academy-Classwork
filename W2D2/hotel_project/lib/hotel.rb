require_relative "room"

class Hotel
  
    def initialize(name, hash) # hash = {name of room => capacity}
        @name = name
        @rooms = {}
        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        cap_name = []
        @name.split(" ").each {|word| cap_name << word.capitalize}
        return cap_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.include?(room_name)
            return true
        end
        return false
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].full? == false
                @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        vals = @rooms.map {|k,v| v.full?}
        vals.include?(false) ? true : false
    end

    def list_rooms
        @rooms.each do |k, v| 
            puts k + v.available_space.to_s
        end
    end
end
