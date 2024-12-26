class Hand
    MAX_ANGLE = 43200

    attr_reader :angle

    def initialize
        @angle = 0
    end
end

class MinuteHand < Hand
    def pass_second
        @angle += 12
        if @angle == MAX_ANGLE
            @angle = 0
        end
    end
end

class HourHand < Hand
    def pass_second
        @angle += 1
        if @angle == MAX_ANGLE
            @angle = 0
        end
    end
end