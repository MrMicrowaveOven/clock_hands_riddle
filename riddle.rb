def run
    mh = MinuteHand.new
    hh = HourHand.new
    times_crossed = []
    mh.pass_second
    hh.pass_second
    until hh.angle == 0
        mh.pass_second
        hh.pass_second
        if (mh.angle - hh.angle).abs < 6
            time = get_time(hh.angle)
            times_crossed << time
            # times_crossed << hh.angle
        end
    end
    times_crossed
end

def get_time(angle)
    hour = angle / 3600
    minute = angle / 720
    second = angle % 60
    "#{hour}:#{minute > 9 ? minute : '0' + minute.to_s}:#{second > 9 ? second : '0' + second.to_s}"
end

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

p run