# When do the minute hand and the hour hand of a clock line up?

It's a riddle as old as clocks themselves.  A minute hand takes an hour to rotate the clock, while the hour hand takes 12 hours to rotate the clock.  So at what times do they line up exactly?

Initially when I heard the riddle, I knew it was easy to guesstimate a few.  Noon is an easy one, 1:05 and some change, etc.  Then someone asked me to round it to the nearest second, which I couldn't do on the spot.

So what do I do when there's a riddle I can't solve in my head?  I write a program to solve it for me!  Just as challenging, and arguably more fun.

## The Hands

The minute hand and the hour hand work very similarly, so they'll share a parent class.  A hand has an angle (with 0° being at noon), and every second it moves a little.  This amount that it moves will vary by hand.

When the hand gets to 360°, it'll reset to 0°.

The minute hand moves 1/60 of the way around the clock every minute.  The hour hand moves 1/12 of the way around the clock every hour.  I considered using decimals of degrees, but realized that this could get messy very quickly.

My solution?  Make a unit that is as small as we need.  Since we need this rounded to the nearest second, I defined a unit that is the angle that the hour hand moves in a second.  It's very small.  Since the hour hand moves entirely around the circle in 12 hours (which is 12 * 60 * 60 seconds), I define a loop around the clock as 12 * 60 * 60 = 43,200 units.  So this unit is 1/43,200th of the way around the circle.

The name of the unit?  I went with a __fourthreet__ (credit to my dad), which is short for Four-Three-Two-Hundredths.  Makes it really easy to remember 43,200 on the fly.

The hour hand moves 1 fourthreet every second.  How many fourthreets does the minute hand move per second?

Well the minute hand takes 3600 seconds to go around, so every second it moves 1/3600 of the way which is 43,200/3,600 = 12 fourthreets.  This makes sense since it circles the clock 12 times as fast as the hour hand.

## Knowing when the Hands cross

Put simply, if the angles of the two hands match, they have crossed.  However, since the minute hand is moving at 12 fourthreets per second, the angles will not necessarily match exactly on the second.  So instead, every second we'll check to see if they're within 6 fourthreets of each other.  If they are, we can round to the second and mark it as a "cross".

When this happens, we'll have the location of both the minute and the hour hand, in fourthreets.  But we want to know the exact time when this occurs.  How do we convert this to Hours, Minutes, and Seconds?

### Finding the hour

With 43,200 fourthreets around the clock, we want to know which 1/12th of the clock it's in to give us the hour.  So we divide the angle of the hour hand by 3600, since 43,200/12 = 3600.  That'll give us the hour.

### Finding the minute

With 43,200 fourthreets around the clock, we want to know which 1/60th of the clock it's in to give us the minute.  So we divide the angle of the hour hand by 720, since 43,200/60 = 720.  That'll give us the minute.

### Finding the second

Since the hour hand moves 1 fourthreet every second, we can get the seconds by dividing the angle of the hour hand by 60 and taking the remainder.  So we have the exact second.

## Running the code

And voila!  After running the code, we have the following times:

* 1:05:27
* 2:10:55
* 3:16:22
* 4:21:49
* 5:27:16
* 6:32:44
* 7:38:11
* 8:43:38
* 9:49:05
* 10:54:33
* 0:00:00

After a quick spotcheck with the easy ones, the cross happens just after 1:05 and just before 10:55.  Makes sense.

So in total, there are 11 times that the minute and the hour hand cross in a 12 hour period.  In a full day (24 hours), they will cross 22 times.