require_relative 'hands'

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

p run