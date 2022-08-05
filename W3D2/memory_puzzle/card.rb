class Card

    attr_reader :value, :face_down

    def initialize(value)
        @value = value
        @face_down = true
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    def display
        return value
    end

end 