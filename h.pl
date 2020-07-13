use strict;
use warnings;

use Heli;

print Heli::takeoff( 150 );
print Heli::show_altitude(), " \n ";

print Heli::fire( 3, 4 );
print Heli::missle_indicator();

Heli::move( 1,1 );
print Heli::show_position();

print Heli::landing( 6 );
print Heli::show_altitude(), " \n ";




__END__